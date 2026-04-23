class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.24.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.24.8/mcpproxy-0.24.8-darwin-arm64.tar.gz"
      sha256 "e99dfa23dda29d14e3d7cbee32715361927430d6bdd3429e25e50f8f7483fb14"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.24.8/mcpproxy-0.24.8-darwin-amd64.tar.gz"
      sha256 "1f2e2d6ed24903cf8ac2c350c0e0a401fcf5523696e74e42a853fc7954f44353"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.24.8/mcpproxy-0.24.8-linux-arm64.tar.gz"
      sha256 "3348d48b37e0112b83cc70b176bd6442290d23cbe2c05fe1f419fa74ebf117de"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.24.8/mcpproxy-0.24.8-linux-amd64.tar.gz"
      sha256 "b1487abf8366fdf72eabf0069a7afae78c4a938d3834b267c5ee36687a5fbb7a"
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
