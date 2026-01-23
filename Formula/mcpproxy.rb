class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.16.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.16.0/mcpproxy-0.16.0-darwin-arm64.tar.gz"
      sha256 "9ebe2e984ca1002c52ed4bf4d042209872413c85710521d8340224e0603f5f36"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.16.0/mcpproxy-0.16.0-darwin-amd64.tar.gz"
      sha256 "3fc72cae1625414208e857fa7741a4bd0d3ad2c26646c4ec1dfc530e67dc7f46"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.16.0/mcpproxy-0.16.0-linux-arm64.tar.gz"
      sha256 "99e8ae85762d4f87a602ae8c189f022d93468e6b0aa93ab4a8fc82950dc9ecea"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.16.0/mcpproxy-0.16.0-linux-amd64.tar.gz"
      sha256 "d6522b11943792e6f946ac888ff8d0d3e8aedd737e8bddc46a8daae70047241f"
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
