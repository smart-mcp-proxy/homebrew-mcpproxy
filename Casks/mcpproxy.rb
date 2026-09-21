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
  version "0.68.0"

  on_arm do
    sha256 "34b66d8febe21b9784f7d6401e28b97b7aaf7ff978a977e432c9ed9d30c28f17"

    url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v#{version}/mcpproxy-#{version}-darwin-arm64-installer.dmg"
  end
  on_arm do
    pkg "mcpproxy-#{version}-darwin-arm64.pkg"
  end
  on_intel do
    sha256 "c8ba9067ce28c2b974931759d88447327a7b559215f71b586a6c9e73684fa71d"

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
