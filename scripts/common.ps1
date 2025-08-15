function Write-Log {
  param(
    [string]$Message,
    [ValidateSet("INFO","WARN","ERROR")][string]$Level = "INFO"
  )
  $timestamp = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
  Write-Host "[$timestamp] [$Level] $Message"
}

function Load-DotEnv {
  param([string]$Path)
  if (-not (Test-Path $Path)) { return }
  Get-Content $Path | Where-Object { $_ -match "^\s*[^#]" } | ForEach-Object {
    if ($_ -match "^\s*([^=]+)\s*=\s*(.*)\s*$") {
      $key = $matches[1].Trim()
      $val = $matches[2]
      if ($val.StartsWith('"') -and $val.EndsWith('"')) { $val = $val.Substring(1, $val.Length-2) }
      if ($val.StartsWith("'") -and $val.EndsWith("'")) { $val = $val.Substring(1, $val.Length-2) }
      [System.Environment]::SetEnvironmentVariable($key, $val, "Process")
    }
  }
}