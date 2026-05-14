class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.31.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.31.0/mcpproxy-0.31.0-darwin-arm64.tar.gz"
      sha256 "5fa810f69af66496183a9451d39fcce93896783b03e94a48a7083fdd2aa298ef"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.31.0/mcpproxy-0.31.0-darwin-amd64.tar.gz"
      sha256 "5f9ade2e8f6a492d633723e8ec571b48ae49b114aa52f96c0f73ae21dc538479"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.31.0/mcpproxy-0.31.0-linux-arm64.tar.gz"
      sha256 "84faaf98d2d8bdeb12a3420da0bcee6900b8ae11e6d8ada2958ba2e298045328"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.31.0/mcpproxy-0.31.0-linux-amd64.tar.gz"
      sha256 "cce5291b796dd3be7195dc3cfa9409add55604a7acb20641e4678a69da70604f"
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
