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
  version "0.72.0"

  on_arm do
    sha256 "e5a77a3b998493d7236fd7cbab2507a6704ee8f242369077cc6dbe55a45ad3df"

    url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v#{version}/mcpproxy-#{version}-darwin-arm64-installer.dmg"
  end
  on_arm do
    pkg "mcpproxy-#{version}-darwin-arm64.pkg"
  end
  on_intel do
    sha256 "1c7ff2d38228fecf147316db128e135d643098e2d42da0696610f6255a718d05"

    url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v#{version}/mcpproxy-#{version}-darwin-amd64-installer.dmg"
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
