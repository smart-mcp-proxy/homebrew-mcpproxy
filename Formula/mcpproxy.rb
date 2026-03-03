class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.19.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.19.1/mcpproxy-0.19.1-darwin-arm64.tar.gz"
      sha256 "0e5a90e091864f035a82c2efc364a0b8d148dbc56784613e82e7ebf2fafa95b3"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.19.1/mcpproxy-0.19.1-darwin-amd64.tar.gz"
      sha256 "52960b891b2f0ff53b954f7a022735a73847d335722228ae8aa0a93784eb7149"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.19.1/mcpproxy-0.19.1-linux-arm64.tar.gz"
      sha256 "b3a8a4fbd792e9736c77a4d4f079ae82f87dcc0ceb9764b532f9b0b334841e8b"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.19.1/mcpproxy-0.19.1-linux-amd64.tar.gz"
      sha256 "b6b8ef691500b1bff7c6d9f9273b21ad878808a8b9a2edd385d7c46ca4b23758"
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
