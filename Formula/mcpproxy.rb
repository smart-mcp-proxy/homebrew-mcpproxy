class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.21.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.21.3/mcpproxy-0.21.3-darwin-arm64.tar.gz"
      sha256 "417d4e03b7b5d31e2e72866d9cfec46839c9dcc74ea28dd82e15a0a2c8422c0a"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.21.3/mcpproxy-0.21.3-darwin-amd64.tar.gz"
      sha256 "c8f35af2298ab8d76619ea5d341cb4dc4b5ca4a7135d18b2e60f94df0a137445"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.21.3/mcpproxy-0.21.3-linux-arm64.tar.gz"
      sha256 "70e071c2a07fd32a718a7ef8ecf8a8b50b2893fceb25e6f474fcbc5d4fef5ce2"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.21.3/mcpproxy-0.21.3-linux-amd64.tar.gz"
      sha256 "ee08191ffb534d40f0a38c96700efa05a9312daf0445e7cb37d74ec8d30c473c"
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
