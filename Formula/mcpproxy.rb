class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.33.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.33.0/mcpproxy-0.33.0-darwin-arm64.tar.gz"
      sha256 "c15eb70c9bdaab7bc61d50262f148baac503b5404af6b27be7988e3e5807f232"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.33.0/mcpproxy-0.33.0-darwin-amd64.tar.gz"
      sha256 "1c2c4cba825edd112ada01b9bcd621f9f07fe7152b8bedaecba0e5f3fab7730b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.33.0/mcpproxy-0.33.0-linux-arm64.tar.gz"
      sha256 "57ed72cda4cf57320505efa550d9849039485979244a544fcc8a3cf5b8ad0d5b"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.33.0/mcpproxy-0.33.0-linux-amd64.tar.gz"
      sha256 "1f7f60e749108a6c3d581891fe47c794ecc48fda6f3ae281f8dcba694d6bd6b4"
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
