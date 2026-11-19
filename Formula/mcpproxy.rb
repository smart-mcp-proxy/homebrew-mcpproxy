class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.74.0/mcpproxy-0.74.0-darwin-arm64.tar.gz"
      sha256 "245e58b273e3ea3ec4d455cb5edcd2d277927a6f47fcffd342aa1e0fb9f89780"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.74.0/mcpproxy-0.74.0-darwin-amd64.tar.gz"
      sha256 "cc42752cf55687409f881ba0cf22705bc462a118a40d48a4f0877626f49e1ee1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.74.0/mcpproxy-0.74.0-linux-arm64.tar.gz"
      sha256 "e4053d146d97807d8ddf00e2d1d4b86fbf5589cd609d245c6f7f04a4abc3e5b8"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.74.0/mcpproxy-0.74.0-linux-amd64.tar.gz"
      sha256 "525ec3ea2301d1640b2cc2f07ad4ecec9bdbe4df4b387c3140d017d8cd76bb8c"
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
