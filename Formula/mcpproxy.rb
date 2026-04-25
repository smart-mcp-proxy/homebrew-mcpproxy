class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.25.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.25.0/mcpproxy-0.25.0-darwin-arm64.tar.gz"
      sha256 "1852327ae3c6b3e43ddfafc3d0e96f15d9832a3a5d10d16cc20956c88d4c2374"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.25.0/mcpproxy-0.25.0-darwin-amd64.tar.gz"
      sha256 "9e2b88152cf9911bd49b8863bd163c33c583996ddda907536f72fbfa08fac2f1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.25.0/mcpproxy-0.25.0-linux-arm64.tar.gz"
      sha256 "d62f2b552d575bc2e0acdaa07986702354a9b5d80803b4232db86d348f69abde"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.25.0/mcpproxy-0.25.0-linux-amd64.tar.gz"
      sha256 "09ec9c4e8fe9ec142e62a531c59cc229064db1faa9779e8e375a7183cf04f3e2"
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
