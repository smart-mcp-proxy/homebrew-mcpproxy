class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.73.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.73.0/mcpproxy-0.73.0-darwin-arm64.tar.gz"
      sha256 "5afc89a3b520c44cb06d245f4b8854eee66ef3251b50910ff9bb4fafa5a1ada4"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.73.0/mcpproxy-0.73.0-darwin-amd64.tar.gz"
      sha256 "7aa4c5fa15e331fd7de75f8549906cad0608d67efed1a1c0cf43e6e9d0cc9600"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.73.0/mcpproxy-0.73.0-linux-arm64.tar.gz"
      sha256 "7365ef33d05a4d72fec25afdff761019c8efab3881286ffd14446e17c1bd0829"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.73.0/mcpproxy-0.73.0-linux-amd64.tar.gz"
      sha256 "b2fcb5aa0879c363e2a2469f7d44506e3e4bd9ceca5be429553f2c82528395f7"
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
