class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.33.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.33.4/mcpproxy-0.33.4-darwin-arm64.tar.gz"
      sha256 "9246060699851c6f8dcc58fa0d58ffd0dd3f77869c6e571ef4917501077cee12"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.33.4/mcpproxy-0.33.4-darwin-amd64.tar.gz"
      sha256 "bca3bda8d86f5ac9539e3b39ea324980b23d479b4d518dde3803c65ecf42a7a2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.33.4/mcpproxy-0.33.4-linux-arm64.tar.gz"
      sha256 "74a7f7f60ed4b75b27e9c68ea76d8d34cb6a44a5f56da44fa5cd50f75d031aee"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.33.4/mcpproxy-0.33.4-linux-amd64.tar.gz"
      sha256 "a77c220374d3c77dc6ae1376be74d4ee40258436274c3079035912d04cb864ff"
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
