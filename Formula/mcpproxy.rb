class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.16.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.16.8/mcpproxy-0.16.8-darwin-arm64.tar.gz"
      sha256 "81617cbbc86fd48d9f949c69d575339160cd8fcdd441b32ef51617a95146323b"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.16.8/mcpproxy-0.16.8-darwin-amd64.tar.gz"
      sha256 "08f226f895e030595f0275d024fd3170cd796b59ef84054e333d98f9558a0462"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.16.8/mcpproxy-0.16.8-linux-arm64.tar.gz"
      sha256 "ce4b4921b7f968071ecd9e7d312abdfe636f7a8fdc4b2463b889614bb9e45f33"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.16.8/mcpproxy-0.16.8-linux-amd64.tar.gz"
      sha256 "d380fb1a711c8f64c08c644431ecc004401928b4f7ef27ce4ab94ca96fb12668"
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
