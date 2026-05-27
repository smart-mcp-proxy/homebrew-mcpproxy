class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.33.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.33.5/mcpproxy-0.33.5-darwin-arm64.tar.gz"
      sha256 "8ee9302df2d58607d8aaad2dfaa45e0f4dc795058c438cdfed9d3f0ad7f97817"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.33.5/mcpproxy-0.33.5-darwin-amd64.tar.gz"
      sha256 "6fdce043291c8cae80c5c18ebd3cdd26acb85a94aa46857692635d9f068d5b82"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.33.5/mcpproxy-0.33.5-linux-arm64.tar.gz"
      sha256 "a45ab75f73aff0b5a13e1e456bce20baa30249399d6894147c2d8c1de2115eab"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.33.5/mcpproxy-0.33.5-linux-amd64.tar.gz"
      sha256 "62be47dbee9a673437fc3bdf741649c4bbf03e6cef07f3d292deace82a1c3a48"
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
