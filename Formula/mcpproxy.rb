class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.41.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.41.0/mcpproxy-0.41.0-darwin-arm64.tar.gz"
      sha256 "b7c735439d353f5370481fc050ec3ae31c165a4a4f6d6964bed71a4d769bbe0e"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.41.0/mcpproxy-0.41.0-darwin-amd64.tar.gz"
      sha256 "0a8fe297371e00370da0c2120d7c49babbaafcce45d793edc7bf716e2f4e5b21"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.41.0/mcpproxy-0.41.0-linux-arm64.tar.gz"
      sha256 "1e951001ac822e56367d3dc22d8afec8493fe0e2a7e61af4a9a7aea7f11bb751"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.41.0/mcpproxy-0.41.0-linux-amd64.tar.gz"
      sha256 "1d02168da545dfe4eb09485a13c0e3fbd1f229a437e38d8d61fa6304b54061c1"
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
