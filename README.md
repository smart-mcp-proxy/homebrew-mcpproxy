# Homebrew Tap for mcpproxy

This repository contains the Homebrew formula for [mcpproxy](https://github.com/smart-mcp-proxy/mcpproxy-go), a Smart MCP Proxy for intelligent tool discovery and proxying for Model Context Protocol servers.

## Installation

### Quick Install

```bash
brew install smart-mcp-proxy/mcpproxy/mcpproxy
```

### Manual Tap and Install

```bash
# Add the tap
brew tap smart-mcp-proxy/mcpproxy

# Install mcpproxy
brew install mcpproxy
```

## Usage

After installation, you can use mcpproxy directly:

```bash
# Show version
mcpproxy --version

# Show help
mcpproxy --help

# Run with default settings
mcpproxy

# Run with custom config
mcpproxy --config /path/to/config.yaml

# Run with custom data directory
mcpproxy --data-dir /path/to/data

# Enable tray mode (default)
mcpproxy --tray

# Disable tray mode
mcpproxy --tray=false
```

## Updating

To update mcpproxy to the latest version:

```bash
brew update
brew upgrade mcpproxy
```

## Uninstalling

To remove mcpproxy:

```bash
brew uninstall mcpproxy
```

To remove the tap:

```bash
brew untap smart-mcp-proxy/mcpproxy
```

## Development

This formula is maintained as part of the mcpproxy project. For issues related to the Homebrew formula, please open an issue in the [main mcpproxy repository](https://github.com/smart-mcp-proxy/mcpproxy-go/issues).

## License

This Homebrew formula is licensed under the same license as mcpproxy.
