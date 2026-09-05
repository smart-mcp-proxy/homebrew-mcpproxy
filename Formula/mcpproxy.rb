class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.65.0/mcpproxy-0.65.0-darwin-arm64.tar.gz"
      sha256 "454b9040e7e698992f55e2e35111be09ed3fbe91f268a5c2a073cacbc9c4574a"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.65.0/mcpproxy-0.65.0-darwin-amd64.tar.gz"
      sha256 "c04812166d5b86536dded94b324d552b82a283187e5e0cb33422e786df3f41a4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.65.0/mcpproxy-0.65.0-linux-arm64.tar.gz"
      sha256 "13127cde6d109eacf762277e3329ceeb9b928ff0863de6af8a82808b5f771549"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.65.0/mcpproxy-0.65.0-linux-amd64.tar.gz"
      sha256 "382be830e2a16613fdba94cf974501cb51ba1c9e73befff4b425bd88e24c8db9"
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
