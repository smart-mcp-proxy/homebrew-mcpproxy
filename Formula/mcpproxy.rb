class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.42.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.42.0/mcpproxy-0.42.0-darwin-arm64.tar.gz"
      sha256 "23ea39631ca1db236c038149e13f2020374c092db6535ec33200c299c0a4d605"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.42.0/mcpproxy-0.42.0-darwin-amd64.tar.gz"
      sha256 "56d2efb85362fdb291a29f8abc926e009f725e8d4fe57e7cfaa98ccc90ad0cfc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.42.0/mcpproxy-0.42.0-linux-arm64.tar.gz"
      sha256 "327f0bf90dc883c7a64477e87ace3c7fb23f7e179ff262372568dabbaa9ff189"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.42.0/mcpproxy-0.42.0-linux-amd64.tar.gz"
      sha256 "1486e6e416991a246c3e53fac0819675f7a5e76dc4c2e8f7eace7a8ad0b2c306"
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
