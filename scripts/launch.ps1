param(
  [Parameter(Mandatory=$true)][string]$ConfigPath
)

$ErrorActionPreference = "Stop"

# Import shared helpers
. $PSScriptRoot\common.ps1

Write-Log "Launching MCP server using config: $ConfigPath"

if (-not (Test-Path $ConfigPath)) {
  Write-Log "Config file not found: $ConfigPath" "ERROR"
  exit 1
}

# Load .env if present in the working directory
if (Test-Path ".\.env") {
  Write-Log "Loading .env ..."
  Load-DotEnv ".\.env"
}

# TODO: Replace this section with actual MCP server launch logic.
Write-Log "Pretending to start MCP server (stub)..."
Start-Sleep -Seconds 2
Write-Log "MCP server started successfully (stub)."
