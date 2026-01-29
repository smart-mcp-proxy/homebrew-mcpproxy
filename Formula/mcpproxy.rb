class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.16.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.16.6/mcpproxy-0.16.6-darwin-arm64.tar.gz"
      sha256 "bf69730fe944637455dc06302997c3e6931c5ae456475213b73877087bf4f4ec"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.16.6/mcpproxy-0.16.6-darwin-amd64.tar.gz"
      sha256 "488aec647b30e7cb2718b3c3da677139e111cd832fc4a01d81fa5339f17c1c98"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.16.6/mcpproxy-0.16.6-linux-arm64.tar.gz"
      sha256 "b2ae1f60e7a3a9d54f50c6e88cd7ff47b73ccb1440bb12e4984ac658dc1ccde1"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.16.6/mcpproxy-0.16.6-linux-amd64.tar.gz"
      sha256 "27cb41ce8dfc7dad1a994d58e3b6f5698fdad528904f737d08eb6461f3bf90b8"
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
