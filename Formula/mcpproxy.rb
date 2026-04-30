class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.28.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.28.1/mcpproxy-0.28.1-darwin-arm64.tar.gz"
      sha256 "8cd14f9e1b098e906d37190f5f2f8f40bec6c84d3efdbce0e5cc32d594f6bb1f"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.28.1/mcpproxy-0.28.1-darwin-amd64.tar.gz"
      sha256 "5ae9d1aaec1bb9de9ed9d1c333ab026e751620d96bd19b15de624dab727b9cf6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.28.1/mcpproxy-0.28.1-linux-arm64.tar.gz"
      sha256 "cee1f50ff8a9605de34a6d161d85b77f73028765bbab50f53e98f54a92660ee2"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.28.1/mcpproxy-0.28.1-linux-amd64.tar.gz"
      sha256 "d2c8f93d197b209dcb408586c95b16ae660831ab2dd6bb5b350909cdaadff634"
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
