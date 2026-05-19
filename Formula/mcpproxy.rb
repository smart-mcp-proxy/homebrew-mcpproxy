class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.32.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.32.1/mcpproxy-0.32.1-darwin-arm64.tar.gz"
      sha256 "4049238160370aa1918da07efd9c8ed3b0cc8e96f5bb11ba14f61da0b3545364"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.32.1/mcpproxy-0.32.1-darwin-amd64.tar.gz"
      sha256 "8ab1f2ecdd2b12f75e387eb3ecc094f5b207e7b49e6ad0a584c4270f59baccf7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.32.1/mcpproxy-0.32.1-linux-arm64.tar.gz"
      sha256 "3c05ae8051ae9140328aa5cd5cb4c014e6114a6f737ac54af9a36b2046a877dc"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.32.1/mcpproxy-0.32.1-linux-amd64.tar.gz"
      sha256 "ec114ff41fde81ecc3077f3430e6886a03627542535983c0515f255521212cb4"
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
