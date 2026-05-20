class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.33.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.33.1/mcpproxy-0.33.1-darwin-arm64.tar.gz"
      sha256 "df2341d13453a456aca5bf36ec8baa8c642188d185b22b30170fbef37af8ebc3"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.33.1/mcpproxy-0.33.1-darwin-amd64.tar.gz"
      sha256 "94e392e8d4e3304836f7bf4a2e3d2e5eac3054ff498b7fac1ec52effd8e5059b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.33.1/mcpproxy-0.33.1-linux-arm64.tar.gz"
      sha256 "32a3fcae9bfd1a494f0658a8099099a412be0d2b57684cb92171836549e122c2"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.33.1/mcpproxy-0.33.1-linux-amd64.tar.gz"
      sha256 "e3b547ac232f1296c7fb4cf2a9854f120faa396b7a56f8bb7303fbe70ca20db3"
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
