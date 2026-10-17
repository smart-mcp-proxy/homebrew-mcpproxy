class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.71.1/mcpproxy-0.71.1-darwin-arm64.tar.gz"
      sha256 "24752b5f2ead7e63831cb1f1f7f613b488791311101ac3172968a3729ca18dc1"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.71.1/mcpproxy-0.71.1-darwin-amd64.tar.gz"
      sha256 "bb0d7c9571c61b6e362728da5489de18efceb99b151feb73e21b32f615672212"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.71.1/mcpproxy-0.71.1-linux-arm64.tar.gz"
      sha256 "af407f17a72a3da7351780af6f87e6359b04d39081c1cad47946ce0939b109b8"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.71.1/mcpproxy-0.71.1-linux-amd64.tar.gz"
      sha256 "d312bd3516ba39c705958a097b889402d08b07a74f67128394f4e27610e182fc"
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
