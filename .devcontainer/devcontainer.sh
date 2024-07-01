{
  "$schema": "https://raw.githubusercontent.com/devcontainers/spec/main/schemas/devContainer.schema.json",
  "name": "Flux Cluster Template",
  "image": "ghcr.io/nea0d/homelab-ops/devcontainer:base",
  "postCreateCommand": {
    "setup": "bash ${containerWorkspaceFolder}/.devcontainer/postCreateCommand.sh"
  },
  "postStartCommand": {
    "git": "git config --global --add safe.directory ${containerWorkspaceFolder}"
  }
}