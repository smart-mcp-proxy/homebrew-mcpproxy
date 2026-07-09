class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.48.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.48.0/mcpproxy-0.48.0-darwin-arm64.tar.gz"
      sha256 "2bbc5081a037f3f74037fe617c708e90ff632fc451c0b32bf8bc6a7a8bf37063"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.48.0/mcpproxy-0.48.0-darwin-amd64.tar.gz"
      sha256 "7901fa7380ee746733f90098a6c9a88464013f0e740e7d2ea2213e15e9aca46c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.48.0/mcpproxy-0.48.0-linux-arm64.tar.gz"
      sha256 "a0f0795fbe6021d4ad80b4fb5004c224264f923a7bd2a880d7711c7b59633b41"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.48.0/mcpproxy-0.48.0-linux-amd64.tar.gz"
      sha256 "0eac5b29093936bec1f1ea87459339085d0b2f1580a062b84481327a2c1ed04a"
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
