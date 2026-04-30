class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.29.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.29.1/mcpproxy-0.29.1-darwin-arm64.tar.gz"
      sha256 "593df7fe8bbdf4ac2cd86d9aad068cabe1a3d2b10cc475228cab5ac55ee2470e"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.29.1/mcpproxy-0.29.1-darwin-amd64.tar.gz"
      sha256 "5095a28f7261d2d1c63767fe0c3234120ae586c00990c05a31a483ea10f6b0ac"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.29.1/mcpproxy-0.29.1-linux-arm64.tar.gz"
      sha256 "3f02b20e8e4dc957921e3fef71cc646e50346e7e5a9ac2e7fe530cafddda96ae"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.29.1/mcpproxy-0.29.1-linux-amd64.tar.gz"
      sha256 "da7a462cbcf34ea81cb68e7f6c0a6c9259654e4a46732714d9cffd9220763557"
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
