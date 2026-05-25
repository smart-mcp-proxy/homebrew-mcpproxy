class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.33.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.33.3/mcpproxy-0.33.3-darwin-arm64.tar.gz"
      sha256 "ab18c587b828eedecef7daacb0b54af1e28296444173ba12da728e6596d3170f"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.33.3/mcpproxy-0.33.3-darwin-amd64.tar.gz"
      sha256 "219b4bce51c1afd39269cfc8e0f5538075a8b23f7ad07382ed5b7c799a802369"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.33.3/mcpproxy-0.33.3-linux-arm64.tar.gz"
      sha256 "1c2d1704c5b60e24a7dd6950c41f9ede850d6063f16f357ce53f19c6b87d1ef3"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.33.3/mcpproxy-0.33.3-linux-amd64.tar.gz"
      sha256 "8136d901ab3f022ac7231896587b440e27a267ce6fb619bb080292fa2a7de4c7"
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
