class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.62.0/mcpproxy-0.62.0-darwin-arm64.tar.gz"
      sha256 "f426e01e6508b84b1d570f548e780f7a56108e673b686d4f7f59aa760389ce3f"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.62.0/mcpproxy-0.62.0-darwin-amd64.tar.gz"
      sha256 "7859f5a217afc60bc393e722c3320b6c033d9c1573bf1f4740392939d47ac7b4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.62.0/mcpproxy-0.62.0-linux-arm64.tar.gz"
      sha256 "125e7dfc8eded5f0322b179dfaa8e045a3d2ff54e5514506927a437c27e97f3c"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.62.0/mcpproxy-0.62.0-linux-amd64.tar.gz"
      sha256 "cb4b8c20880b9d6fa481890823dcb167cc3c4b878fe43de12ba2fee29dac1662"
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
