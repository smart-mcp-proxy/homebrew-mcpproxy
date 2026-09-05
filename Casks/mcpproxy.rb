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
  version "0.65.0"

  on_arm do
    sha256 "3f030a8f83fb5ac8b1c2e2f6aad0dcef63f020f6465d9be00ed6d0a920f559ea"

    url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v#{version}/mcpproxy-#{version}-darwin-arm64-installer.dmg",
        verified: "github.com/smart-mcp-proxy/mcpproxy-go/"
  end
  on_arm do
    pkg "mcpproxy-#{version}-darwin-arm64.pkg"
  end
  on_intel do
    sha256 "188529df3e6ea8494c9b4abe058d276924ebeea30c4a4d4d51976d88406e3705"

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
