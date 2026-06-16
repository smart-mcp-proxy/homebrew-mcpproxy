class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.39.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.39.0/mcpproxy-0.39.0-darwin-arm64.tar.gz"
      sha256 "c0e49f5acdb65331d51cc7502b4bf8d36d016403692eda0939e13428a6508884"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.39.0/mcpproxy-0.39.0-darwin-amd64.tar.gz"
      sha256 "6659563e3fa5a846748dcfc843bdfd6382672bd1cddfcf8264bc9576517ba381"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.39.0/mcpproxy-0.39.0-linux-arm64.tar.gz"
      sha256 "c6227dacc5a5e3949067b89ab3386e380b894266e0b53868de2e68ddaa95ca71"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.39.0/mcpproxy-0.39.0-linux-amd64.tar.gz"
      sha256 "04d1a5993a706bf9670089becf2250d9e60f07c59b03128c2ec5557c75a697e6"
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
