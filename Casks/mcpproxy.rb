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
  version "0.24.2"

  on_arm do
    sha256 "1a0d805eef844c7c1592bc26cbf955ce8cbcdb27f1fc6e94a1435d609bc2faaa"
    url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v#{version}/mcpproxy-#{version}-darwin-arm64-installer.dmg",
        verified: "github.com/smart-mcp-proxy/mcpproxy-go/"
  end

  on_intel do
    sha256 "a819238a1c21a4f92a16dc0490696110cc46163479915a5696f8b394a8ae7edd"
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

  uninstall pkgutil: "com.smartmcpproxy.mcpproxy",
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
