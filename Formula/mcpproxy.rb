class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.29.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.29.0/mcpproxy-0.29.0-darwin-arm64.tar.gz"
      sha256 "8df7b6947af8c423dc4f43bc20bc922e1bda2f703dd159894e00fa5f51c37b17"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.29.0/mcpproxy-0.29.0-darwin-amd64.tar.gz"
      sha256 "2d215c34441ed38ab5a42eefbd58f6490539cc04eef565e8688a9314575775a9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.29.0/mcpproxy-0.29.0-linux-arm64.tar.gz"
      sha256 "04d7bb27cb44b3fdca516b23f336951c80242506190f0dfe03ed01aba0cf12c0"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.29.0/mcpproxy-0.29.0-linux-amd64.tar.gz"
      sha256 "25234004187d4ca3cf32eaae6830cd5880c06597a90f6f1c3d5844a84ae57bf9"
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
