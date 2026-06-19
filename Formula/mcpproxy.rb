class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.41.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.41.2/mcpproxy-0.41.2-darwin-arm64.tar.gz"
      sha256 "2556bcdc47dc202e4030f9af55818bdb3bf982fb7d5b45d504f451b7a0e8ce93"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.41.2/mcpproxy-0.41.2-darwin-amd64.tar.gz"
      sha256 "d01bf6a58e620e8ccf9eeda1fc5690d770d1fc5ebd32d548cbdef29256784089"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.41.2/mcpproxy-0.41.2-linux-arm64.tar.gz"
      sha256 "4aa6a28a2c2bd971abcedb6553d06fde3a6c92d1ab186634e4ed0aa4007281e2"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.41.2/mcpproxy-0.41.2-linux-amd64.tar.gz"
      sha256 "2387d2031aaa1355766d0ff479486e862dad15c67e2044899eb791cf74fc25a0"
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
