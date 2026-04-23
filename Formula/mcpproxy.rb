class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.24.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.24.7/mcpproxy-0.24.7-darwin-arm64.tar.gz"
      sha256 "ed33d7b18cd2cb47a3f7b0697c66a995f39b7593da9afbaf6d3e990e04dc252b"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.24.7/mcpproxy-0.24.7-darwin-amd64.tar.gz"
      sha256 "8386a22fb2d1a9123863145740699490d7402909fabd30e7923771bf42926d8d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.24.7/mcpproxy-0.24.7-linux-arm64.tar.gz"
      sha256 "fd78ce1bf76586ee55cf08d352aa8beff7a8ff311615ab4272d9a8c67269dc4b"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.24.7/mcpproxy-0.24.7-linux-amd64.tar.gz"
      sha256 "3196ceb2f39fc0d6a6719776bc650678f6c16e9e642305f58bee9010b275811f"
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
