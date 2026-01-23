class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.16.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.16.3/mcpproxy-0.16.3-darwin-arm64.tar.gz"
      sha256 "0410bd792fec482848112de48b345fce42e7658f269df359eef01636ae63f4c1"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.16.3/mcpproxy-0.16.3-darwin-amd64.tar.gz"
      sha256 "574ab001e8c9e26027f4f57100df4c1f3f6f0baa6943fa7725ec14ac4fffbe32"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.16.3/mcpproxy-0.16.3-linux-arm64.tar.gz"
      sha256 "b5b09c77335905fc4c7b63aba5bb8edec2763d5dfc935eedfbed171611667774"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.16.3/mcpproxy-0.16.3-linux-amd64.tar.gz"
      sha256 "debb54a259c5ace3534f6a72de3295e3ae7ef7e31b4c727c1d0fd07da5d8ff22"
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
