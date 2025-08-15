# mcp-kit

Shared MCP server utilities and launch scripts.

## Purpose
This repository holds all reusable logic for running and managing MCP servers:
- Launch scripts
- Version pinning helpers
- Common PowerShell functions
- Shared configuration handling

## Usage
Each project repo includes this repo as a Git submodule (pinned to a tag/commit) and calls into \scripts/launch.ps1\.

## Version pinning
To pin a project to a specific kit version:
\\\ash
cd mcp-kit
git fetch --tags
git checkout tags/<TAG>
cd ..
git add mcp-kit
git commit -m "Pin mcp-kit to <TAG>"
\\\

## Security
- Keep secrets in project-specific .env files, not here.
- Validate input in scripts/launch.ps1 before passing to servers.