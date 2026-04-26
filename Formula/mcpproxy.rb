class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.26.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.26.3/mcpproxy-0.26.3-darwin-arm64.tar.gz"
      sha256 "1f82bf6a19bed482fd19cbe18fd2613810deb4f42fa3d6f50623433ac0fe04cb"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.26.3/mcpproxy-0.26.3-darwin-amd64.tar.gz"
      sha256 "72c3919642f5998763e61bc6cb1c003a5cfea0a6c0af98024f5f3cc5a7b06672"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.26.3/mcpproxy-0.26.3-linux-arm64.tar.gz"
      sha256 "eb4a09557e8a2211edd6d9dc1daaad8af2c5f5d6898af10c5918feca2e5ae835"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.26.3/mcpproxy-0.26.3-linux-amd64.tar.gz"
      sha256 "4ff972fb58f7d03f25cee66d76e6e58693f816573a584e8c25277aa8cb6cd434"
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
