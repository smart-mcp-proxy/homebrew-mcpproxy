class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.57.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.57.0/mcpproxy-0.57.0-darwin-arm64.tar.gz"
      sha256 "ad200484c50fde650c402615051553c35cf15d57521e86631a848d09053790f9"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.57.0/mcpproxy-0.57.0-darwin-amd64.tar.gz"
      sha256 "3838e8c16543cc5360c609233fe87490c9818a62803c2b32e828825718fb378e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.57.0/mcpproxy-0.57.0-linux-arm64.tar.gz"
      sha256 "d690aa15356d6769417faf810f981b5165fd2ad46e0333e8309e802b74063bfd"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.57.0/mcpproxy-0.57.0-linux-amd64.tar.gz"
      sha256 "1deaee1ab7bfd9842901c4feee33d3d32b24bfa49efc79f9ef9454d1bf1748d4"
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
