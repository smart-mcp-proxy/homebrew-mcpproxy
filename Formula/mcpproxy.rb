class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.35.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.35.0/mcpproxy-0.35.0-darwin-arm64.tar.gz"
      sha256 "7c094da35b02165b3c7a79756a8bfa69d94153eeaac735b9abe516a71410b2ed"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.35.0/mcpproxy-0.35.0-darwin-amd64.tar.gz"
      sha256 "a7e42bc303a596577ca619dee7d0721ac2f1634084708494557fb826f6ca5c0b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.35.0/mcpproxy-0.35.0-linux-arm64.tar.gz"
      sha256 "c710037b9c373bb2b73083a05777862fbf40a0e85f8431e3e5f951b28ccde5d9"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.35.0/mcpproxy-0.35.0-linux-amd64.tar.gz"
      sha256 "5fd8592469117fb4656a8b4d335bdf651219f210d4911a5849b6dcc510b2f97c"
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
