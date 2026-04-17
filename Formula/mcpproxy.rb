class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.24.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.24.6/mcpproxy-0.24.6-darwin-arm64.tar.gz"
      sha256 "910c1eacd59139b62c1775339a869668ec07b0e29b5d9341f67f1967f73a6e9c"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.24.6/mcpproxy-0.24.6-darwin-amd64.tar.gz"
      sha256 "66e933065b92c42d0d00627af8842daa660e472c693bdc4d387677911a70b1c6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.24.6/mcpproxy-0.24.6-linux-arm64.tar.gz"
      sha256 "cccb5f4ecf0a0da1e997f9eebd017819e983c77509f9ca4d67f9afac7eb6ce88"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.24.6/mcpproxy-0.24.6-linux-amd64.tar.gz"
      sha256 "92c54a2a6e3da5f6ae41e042867f855bb6506149e3dc41a27c46f114c27449f2"
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
