class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.40.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.40.0/mcpproxy-0.40.0-darwin-arm64.tar.gz"
      sha256 "4c327b450000d014d052b7070e6ed32333482721c168553ecb2b22b93e2e70c9"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.40.0/mcpproxy-0.40.0-darwin-amd64.tar.gz"
      sha256 "1d9bd73b6843c0443b334ccaf8bd11c57829ffdc025b8eb5d743a41734ada232"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.40.0/mcpproxy-0.40.0-linux-arm64.tar.gz"
      sha256 "6f7f2410fb64491dfd8751ed48f1551b0c4c5e111d81b67575736f25a13692c6"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.40.0/mcpproxy-0.40.0-linux-amd64.tar.gz"
      sha256 "46627f93d7aabe34a7f86bf1c819f97b67aa6a5f0778e1706d307a48954cab2c"
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
