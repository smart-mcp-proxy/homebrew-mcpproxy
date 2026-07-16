class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.51.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.51.0/mcpproxy-0.51.0-darwin-arm64.tar.gz"
      sha256 "ed8e46005ddf5906b919cdf3de59be70cab021caabb4c82e1ba66e65f37a4aac"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.51.0/mcpproxy-0.51.0-darwin-amd64.tar.gz"
      sha256 "030af3c3590b7bc5c73f605e5a7940f26450110ed566f60a129e37d78ad1eac5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.51.0/mcpproxy-0.51.0-linux-arm64.tar.gz"
      sha256 "ef723460b81ffe4c2d9ebbcb7a3982f579bb9c8017e5012909592bf8d6c95732"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.51.0/mcpproxy-0.51.0-linux-amd64.tar.gz"
      sha256 "9f599756623fc91c965117a1116e3c96036732ac1fa87b37576ce58672c9d886"
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
