# typed: false
# frozen_string_literal: true

# Homebrew cask for MCPProxy Tray App (macOS GUI application)
# To install:
#   brew tap smart-mcp-proxy/mcpproxy
#   brew install --cask mcpproxy
#
# The cask installs the tray app (GUI) which includes the core server.
# For the headless CLI only, use: brew install mcpproxy

cask "mcpproxy" do
  version "0.45.0"

  on_arm do
    sha256 "23bfaf1466846c5e70e4e5b566ce7596c7633187e483e9c5c63833994de54f09"
    url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v#{version}/mcpproxy-#{version}-darwin-arm64-installer.dmg",
        verified: "github.com/smart-mcp-proxy/mcpproxy-go/"
  end

  on_intel do
    sha256 "4f8811d8dbd65387f7942e2df4f6638773e3367b102edb12f46b8b2a3f224d8d"
    url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v#{version}/mcpproxy-#{version}-darwin-amd64-installer.dmg",
        verified: "github.com/smart-mcp-proxy/mcpproxy-go/"
  end

  name "MCPProxy"
  desc "Smart MCP proxy with intelligent tool discovery for AI agents"
  homepage "https://mcpproxy.app"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :monterey"

  on_arm do
    pkg "mcpproxy-#{version}-darwin-arm64.pkg"
  end

  on_intel do
    pkg "mcpproxy-#{version}-darwin-amd64.pkg"
  end

  uninstall pkgutil: "com.smartmcpproxy.mcpproxy.pkg",
            launchctl: "com.smartmcpproxy.mcpproxy",
            delete: [
              "/usr/local/bin/mcpproxy",
            ]

  zap trash: [
    "~/.mcpproxy",
    "~/Library/Logs/mcpproxy",
  ]

  caveats <<~EOS
    MCPProxy has been installed!

    To start the tray app, open MCPProxy from your Applications folder.

    To use the CLI directly:
      mcpproxy serve              # Start the server
      mcpproxy doctor             # Run health checks
      mcpproxy upstream list      # List upstream servers

    Configuration: ~/.mcpproxy/mcp_config.json
    Documentation: https://docs.mcpproxy.app
  EOS
end
