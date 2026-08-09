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
  version "0.54.1"

  on_arm do
    sha256 "9082b17452f65b8030d4e104588f9390eeb28334e2c91d6d6d533d2aa0fb5058"

    url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v#{version}/mcpproxy-#{version}-darwin-arm64-installer.dmg",
        verified: "github.com/smart-mcp-proxy/mcpproxy-go/"
  end
  on_arm do
    pkg "mcpproxy-#{version}-darwin-arm64.pkg"
  end
  on_intel do
    sha256 "2fedfbfdec17a078dbf4e6ccc285f580564eb811edae1002e228795117268834"

    url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v#{version}/mcpproxy-#{version}-darwin-amd64-installer.dmg",
        verified: "github.com/smart-mcp-proxy/mcpproxy-go/"
  end
  on_intel do
    pkg "mcpproxy-#{version}-darwin-amd64.pkg"
  end

  name "MCPProxy"
  desc "Smart MCP proxy with intelligent tool discovery for AI agents"
  homepage "https://mcpproxy.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  uninstall launchctl: "com.smartmcpproxy.mcpproxy",
            pkgutil:   "com.smartmcpproxy.mcpproxy.pkg",
            delete:    "/usr/local/bin/mcpproxy"

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
