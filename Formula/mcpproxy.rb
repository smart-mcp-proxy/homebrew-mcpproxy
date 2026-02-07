class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.17.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.17.3/mcpproxy-0.17.3-darwin-arm64.tar.gz"
      sha256 "6ce9e73223af65eed0783aae163e7e0fbcaf9bc08f14598ddc68d5131572974f"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.17.3/mcpproxy-0.17.3-darwin-amd64.tar.gz"
      sha256 "df53980ae2096212b00b79236d604aabcc66492ed9dae0f31cb36569e38ba414"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.17.3/mcpproxy-0.17.3-linux-arm64.tar.gz"
      sha256 "fe3b0a11e89361ae7528e863d01057284e961aca1f10532fd602242bf2b97a14"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.17.3/mcpproxy-0.17.3-linux-amd64.tar.gz"
      sha256 "2107e3bc93b7a0d928bdaba92426c4e35cbd1c46d89530640cc2cdcf12573d99"
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
