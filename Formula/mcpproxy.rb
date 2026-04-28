class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.28.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.28.0/mcpproxy-0.28.0-darwin-arm64.tar.gz"
      sha256 "4dd57c503fa8ed9b6696e79b9ac5e7ddb613a196d2afcd6f739545a350b1b403"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.28.0/mcpproxy-0.28.0-darwin-amd64.tar.gz"
      sha256 "d069f873926c1828e2796852d621ec07443ef756830b419e2d2ddf574cc7c370"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.28.0/mcpproxy-0.28.0-linux-arm64.tar.gz"
      sha256 "4c1f7cc48170b61252115b379cd4f5725082fccff9b1b154e88ad190be89012a"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.28.0/mcpproxy-0.28.0-linux-amd64.tar.gz"
      sha256 "f0ea6e942617a5774c4767f71a56f25c5dc35180381952621aa19c4e4ca7c867"
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
