class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.50.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.50.0/mcpproxy-0.50.0-darwin-arm64.tar.gz"
      sha256 "7ab73d637e4ac29862b443346a0d6185ea0df5be1fc8072cb7940c39c5a1f3d4"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.50.0/mcpproxy-0.50.0-darwin-amd64.tar.gz"
      sha256 "83b8ea02abf7f7e3b792072e215439c60fc59bc06b8ac5e42484dd85735ae935"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.50.0/mcpproxy-0.50.0-linux-arm64.tar.gz"
      sha256 "c48011b07ad04e02f04e58078883ae415b5e40b34f5460781af5a750b557cfd6"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.50.0/mcpproxy-0.50.0-linux-amd64.tar.gz"
      sha256 "900391033ac0194a47e003ea0eff00efcb393db4b6e54184e734c2a49f4dafc9"
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
