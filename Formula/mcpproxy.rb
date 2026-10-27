class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.72.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.72.0/mcpproxy-0.72.0-darwin-arm64.tar.gz"
      sha256 "95612522294c722e004d64073e9781f561726ec3c7256865dba7bb219545e776"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.72.0/mcpproxy-0.72.0-darwin-amd64.tar.gz"
      sha256 "174b8dfe1f4a65b29305864f29a5ccaa18620afb3e119114052340215411bdbd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.72.0/mcpproxy-0.72.0-linux-arm64.tar.gz"
      sha256 "375cda4510010f59132466dd9920d233323ed42e28f0b8b8c5133493bede61b2"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.72.0/mcpproxy-0.72.0-linux-amd64.tar.gz"
      sha256 "a75dba2ed7b1541209b53df5ff5f87cabfcee47532c68140da8a7bbebeacb404"
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
