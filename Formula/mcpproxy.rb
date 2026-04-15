class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.24.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.24.4/mcpproxy-0.24.4-darwin-arm64.tar.gz"
      sha256 "d63be2496eaae5a8a7e44d5a49a9ca3961bfb4eb95d592606449bb1e4261762b"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.24.4/mcpproxy-0.24.4-darwin-amd64.tar.gz"
      sha256 "dc082f80e5d00357da3a7807d0712c398a2b8c6ebf55cc3535e29bc122c66905"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.24.4/mcpproxy-0.24.4-linux-arm64.tar.gz"
      sha256 "9493bd63d87c5a7e741d24971d77c39e9a04642d583393f4e2b17272e4ea14bb"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.24.4/mcpproxy-0.24.4-linux-amd64.tar.gz"
      sha256 "867529ee807438354898c89059a20b4e358edea4833b1b34ea077df9d9a999e4"
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
