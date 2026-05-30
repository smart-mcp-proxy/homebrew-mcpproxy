class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.34.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.34.0/mcpproxy-0.34.0-darwin-arm64.tar.gz"
      sha256 "18a4a1234e6f5388f22c7e7ba123cf9289a03868b1c368b1566b8940a78f36c5"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.34.0/mcpproxy-0.34.0-darwin-amd64.tar.gz"
      sha256 "14f5db29277534c390677d8529febb02cfc1056f411f41f2826f4ca9ca42916d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.34.0/mcpproxy-0.34.0-linux-arm64.tar.gz"
      sha256 "d04bc3eca5fe3c629a4e6b379ed88b4333ada0a00926c08eee14de1b664668ad"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.34.0/mcpproxy-0.34.0-linux-amd64.tar.gz"
      sha256 "eb7e74248012fc569b046231e951931d9d25f394ad83d38131eb49da272c7e00"
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
