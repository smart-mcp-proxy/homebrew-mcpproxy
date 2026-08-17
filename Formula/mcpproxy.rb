class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.58.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.58.0/mcpproxy-0.58.0-darwin-arm64.tar.gz"
      sha256 "334c655598377333b61ce21f738f8de20f894a2c7c10f1e373146f9ca5bc2948"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.58.0/mcpproxy-0.58.0-darwin-amd64.tar.gz"
      sha256 "cd3ec35b5d052d51e0c8aca39f507ecb50280f1d86c2bb6fa57ed210378a4523"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.58.0/mcpproxy-0.58.0-linux-arm64.tar.gz"
      sha256 "1fcb52fcb768f7c7d8de602ee49737e56e9ba02b46d89173e233b88ebb0129ad"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.58.0/mcpproxy-0.58.0-linux-amd64.tar.gz"
      sha256 "20773697cc4fd5c03462cb24147635ae2ee7a543f94d49bac392b382b67ac771"
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
