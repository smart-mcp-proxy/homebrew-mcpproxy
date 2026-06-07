class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.38.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.38.1/mcpproxy-0.38.1-darwin-arm64.tar.gz"
      sha256 "028a7ae2b6c3aab593ad33e1c48e2c9930aea2f871302c3beb97d7e287e2db62"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.38.1/mcpproxy-0.38.1-darwin-amd64.tar.gz"
      sha256 "dfaf876cc0d6e3c715d216bdd691f7d4e7c17abc514cc27c6a0b5403be9eb1d7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.38.1/mcpproxy-0.38.1-linux-arm64.tar.gz"
      sha256 "011eb211536f75ae39bd88ec7b3013cfd105d9c8dec881ceac86e26eaa3dd66e"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.38.1/mcpproxy-0.38.1-linux-amd64.tar.gz"
      sha256 "a71141605047969bbcf4d1d657507a953c5158ccb2dfc6b17253f52d98d30d89"
    end
  end

  def install
    bin.install "mcpproxy"
    bin.install "mcpproxy-tray" if OS.mac? && File.exist?("mcpproxy-tray")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mcpproxy --version")
  end
end
