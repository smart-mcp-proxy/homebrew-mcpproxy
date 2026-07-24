class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.52.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.52.1/mcpproxy-0.52.1-darwin-arm64.tar.gz"
      sha256 "7e541b796af519e12cf25efe7f7bfdf6c34ed1a0be0ea20ae629f966fd9b0131"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.52.1/mcpproxy-0.52.1-darwin-amd64.tar.gz"
      sha256 "d1921db34897dd099aa89d9331a91dba8101518787ff4caf0b8927b0a0c24cdd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.52.1/mcpproxy-0.52.1-linux-arm64.tar.gz"
      sha256 "e38b9b8ff0ded52238ee02ed968e7ea33a353f844fa2a2eeb8dca1ab28044346"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.52.1/mcpproxy-0.52.1-linux-amd64.tar.gz"
      sha256 "4b0e3bb8f988c3c74715ba0691fb5b8416ea7fe4cad83532c1496fc5479a6e8a"
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
