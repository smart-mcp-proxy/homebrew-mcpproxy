class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.24.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.24.9/mcpproxy-0.24.9-darwin-arm64.tar.gz"
      sha256 "4702fd14025bbaf62f72be86f6cf781f4d0b741ca6e1c427fd17d4774c5931cc"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.24.9/mcpproxy-0.24.9-darwin-amd64.tar.gz"
      sha256 "6fc1c3ad8d8f786a576982e7bc778bde022f20fd20db80985deefbc2159dee94"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.24.9/mcpproxy-0.24.9-linux-arm64.tar.gz"
      sha256 "229051636e8b135e3808aaa401204f06ad6e3b2015da9d0fc1bbf910e96cff79"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.24.9/mcpproxy-0.24.9-linux-amd64.tar.gz"
      sha256 "f01dd36e31aa5d726724f4f09472675ac93ad0908717b7e34eb5f0fcb6e15540"
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
