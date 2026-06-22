class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.44.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.44.0/mcpproxy-0.44.0-darwin-arm64.tar.gz"
      sha256 "504fefd4d4ece9158beb24bd950aec8764d0d8babce9a2d4cea0ece61aec450d"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.44.0/mcpproxy-0.44.0-darwin-amd64.tar.gz"
      sha256 "68b3452b73f158382d274e1876d3e6ed2772dfbc201eba06e30ea97c902277dc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.44.0/mcpproxy-0.44.0-linux-arm64.tar.gz"
      sha256 "7055e9b0cc1f459f2be5b0d8dbc229a0696c8d49f6d82ac6c2b70e8add4017fd"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.44.0/mcpproxy-0.44.0-linux-amd64.tar.gz"
      sha256 "a3785b305c547046e0c7b665976abd6d721b1fac501fddea1aca68d8bb93b7d0"
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
