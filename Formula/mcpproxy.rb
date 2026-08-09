class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.54.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.54.0/mcpproxy-0.54.0-darwin-arm64.tar.gz"
      sha256 "7ba2bde26b3a26f08d58e128da5d0e2f19573008fb4b0513d8f319fd3162163f"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.54.0/mcpproxy-0.54.0-darwin-amd64.tar.gz"
      sha256 "5aa3434dc68d319ffc517760af2ea2110cdc652d7ad964bd53fb37017d2119fd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.54.0/mcpproxy-0.54.0-linux-arm64.tar.gz"
      sha256 "418fc6aad3e7e41c56fc67e40dd0a4c73306d3f55ed42c6d67032fbd64a1e86e"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.54.0/mcpproxy-0.54.0-linux-amd64.tar.gz"
      sha256 "b5ce12a118bca2c91b9dd4f42e9a1f7ad6ff5402684245e20d29ac5eaf316307"
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
