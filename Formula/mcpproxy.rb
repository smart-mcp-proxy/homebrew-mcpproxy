class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.66.0/mcpproxy-0.66.0-darwin-arm64.tar.gz"
      sha256 "9e86d2e34aeca5cbc6897a7a361b874b05541ae329ba96b63edd798c76cb49f2"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.66.0/mcpproxy-0.66.0-darwin-amd64.tar.gz"
      sha256 "c4822565a0cee31464aa327936a74d09d5b48a905e905bce9c97b124c36f9bf8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.66.0/mcpproxy-0.66.0-linux-arm64.tar.gz"
      sha256 "513f7d8e6df4e567a60a32c5e299aa5a275a970cd9d59a67e0a51f878e1437c0"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.66.0/mcpproxy-0.66.0-linux-amd64.tar.gz"
      sha256 "0454c170ecb64ca4dd685356b36b974664b302e45e81731e03d6b822e92d4837"
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
