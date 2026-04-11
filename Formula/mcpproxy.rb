class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.24.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.24.1/mcpproxy-0.24.1-darwin-arm64.tar.gz"
      sha256 "bec7d77a9efafff5a59e40d02c26784ebcf2e966f0d6a33290d8a1f3991d4eeb"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.24.1/mcpproxy-0.24.1-darwin-amd64.tar.gz"
      sha256 "627ec99bacec59a48541297690c3ae439b620f91b9c5e835926ac32ed316d704"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.24.1/mcpproxy-0.24.1-linux-arm64.tar.gz"
      sha256 "d964d3397128916d98b59d548464db7f465277bf645404e68fc454a52db95f0d"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.24.1/mcpproxy-0.24.1-linux-amd64.tar.gz"
      sha256 "43214cb46243682f3b0d2eadb789beb23828c8b71daa23a775fecf5c4fcc1943"
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
