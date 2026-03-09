class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.20.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.20.2/mcpproxy-0.20.2-darwin-arm64.tar.gz"
      sha256 "e6f717015fc3342ef9fd40d46f3f4af0ed42c1bb68b978c0c598f8ef8287f8b3"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.20.2/mcpproxy-0.20.2-darwin-amd64.tar.gz"
      sha256 "a9bd1a9fdedf4257cd84e9d0e122935c09730f64944b890e3fcc82e339310f23"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.20.2/mcpproxy-0.20.2-linux-arm64.tar.gz"
      sha256 "5a3917fffbb7741c1b122d1c4bec5fcf8cf25b46778ab0e7d41c59e8513a6e6a"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.20.2/mcpproxy-0.20.2-linux-amd64.tar.gz"
      sha256 "2738c03bd994b132bb302e08665e726c847abc42fdc5e64a8c3e161aa8bed111"
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
