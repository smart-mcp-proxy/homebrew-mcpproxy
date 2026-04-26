class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.26.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.26.1/mcpproxy-0.26.1-darwin-arm64.tar.gz"
      sha256 "1008417a6e283e17dca045faa34b6f7b549ac3991fb4721db245e2e6e2817a82"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.26.1/mcpproxy-0.26.1-darwin-amd64.tar.gz"
      sha256 "7276587ebdac7721360175963a0fd1c7426b45d4a38a8fe88e9ee55ed9ac84a2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.26.1/mcpproxy-0.26.1-linux-arm64.tar.gz"
      sha256 "ce777d6e885e9321373449252ce3159fcecbeec79726b82d5682fa9cb0e20966"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.26.1/mcpproxy-0.26.1-linux-amd64.tar.gz"
      sha256 "1125cf14ff99489742665bc9636a5e9b17ea2c972cd529625f1cec677425f982"
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
