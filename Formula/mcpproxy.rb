class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.17.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.17.5/mcpproxy-0.17.5-darwin-arm64.tar.gz"
      sha256 "804c923fca5dda5865d9f7b0d57dc9bf9bef3746b93bbd819d6c8d81296dd173"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.17.5/mcpproxy-0.17.5-darwin-amd64.tar.gz"
      sha256 "0e764f743bed104ae354a7bda6f4a276c5a5ea31246f8b2584c11299b3a25041"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.17.5/mcpproxy-0.17.5-linux-arm64.tar.gz"
      sha256 "f8dcbcacbf044eafb2f7528134b0889afa536a67c428302b3e21271015e2f7a5"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.17.5/mcpproxy-0.17.5-linux-amd64.tar.gz"
      sha256 "9f08272c53c2d1bd14500b85b96cfa49d3ab07f08958058fcd0cecd9f71a2df0"
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
