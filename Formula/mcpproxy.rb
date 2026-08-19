class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.59.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.59.0/mcpproxy-0.59.0-darwin-arm64.tar.gz"
      sha256 "fbbba46469c803067a8e9d40889d71a28c8dd331ae5f3d74c932d3c48c3562ef"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.59.0/mcpproxy-0.59.0-darwin-amd64.tar.gz"
      sha256 "6b246d21344b3b87c2fa99a91d352039e412b2ba8362c45b0fb412f6482942a6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.59.0/mcpproxy-0.59.0-linux-arm64.tar.gz"
      sha256 "aa1d4e4d3770ffc4b4c0f9b7c42132e0565e0cbb1758db6fe83ed484d858c566"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.59.0/mcpproxy-0.59.0-linux-amd64.tar.gz"
      sha256 "443e26cc0b1ef3b0d108ff02b483b5739cb78338343ffd719b3fdc14d0a55537"
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
