class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.21.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.21.1/mcpproxy-0.21.1-darwin-arm64.tar.gz"
      sha256 "bc675ec896568c4015d3b98592d80e4b3be2264cb7fc7377e077154eea979b5e"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.21.1/mcpproxy-0.21.1-darwin-amd64.tar.gz"
      sha256 "77df77a6085e9b8d16631a5f2dcadacec23e5816cf16d431fdd1746b2904bebc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.21.1/mcpproxy-0.21.1-linux-arm64.tar.gz"
      sha256 "37a2a8b9d93a0fb548b2e306035fd21c48362f8da9f5cd3be840d4490628c079"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.21.1/mcpproxy-0.21.1-linux-amd64.tar.gz"
      sha256 "bc34edb0a987a86567687fdedbcf522ce6739d6d74ec1e3dbf68c83777b1bcb1"
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
