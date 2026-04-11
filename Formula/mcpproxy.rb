class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.24.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.24.0/mcpproxy-0.24.0-darwin-arm64.tar.gz"
      sha256 "c46f8f367d9404b5f09e2e18466cfbbb3b98944912f23998fd8f59c0003208bf"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.24.0/mcpproxy-0.24.0-darwin-amd64.tar.gz"
      sha256 "bcc71f2057172a58c81b5fa14781ee5990202a0341e1727f0e0747e9022a0403"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.24.0/mcpproxy-0.24.0-linux-arm64.tar.gz"
      sha256 "c78706716bfc8b7ab906dbabbb961aef48162c9ee95eb118fcc2cf19d7d148d4"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.24.0/mcpproxy-0.24.0-linux-amd64.tar.gz"
      sha256 "f9a289cc305ebc929febf8622dd9a8d3bed2643f84e1c3330e40287364e44526"
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
