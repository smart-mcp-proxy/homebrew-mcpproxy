class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.26.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.26.0/mcpproxy-0.26.0-darwin-arm64.tar.gz"
      sha256 "f08d46ce802282dec98de3da1616fdfe4d85aed8e43a316023b1f62abc07c61f"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.26.0/mcpproxy-0.26.0-darwin-amd64.tar.gz"
      sha256 "98b5ee5d05382c60a82de8995ad4eda9d4630e0fee9619a52ab967be2b32a02a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.26.0/mcpproxy-0.26.0-linux-arm64.tar.gz"
      sha256 "826b3eb1a90ca631da2972ec9a979c78fde36b72fdbbbd863d472377f704bb32"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.26.0/mcpproxy-0.26.0-linux-amd64.tar.gz"
      sha256 "c85368faff4ebadbb9dded54ece178b1e5ea4b7c5da12c26251eb0d9c6251d4f"
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
