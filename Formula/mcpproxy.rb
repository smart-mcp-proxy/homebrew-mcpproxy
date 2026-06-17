class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.39.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.39.1/mcpproxy-0.39.1-darwin-arm64.tar.gz"
      sha256 "ccb66a6cfeba7a0bbf83ff7d7721ce968540953b879855c58f6b761de08a920b"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.39.1/mcpproxy-0.39.1-darwin-amd64.tar.gz"
      sha256 "30388d2a0dd2028e0023aa68fdc6eb78fb808e6365e70248105f172546109b27"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.39.1/mcpproxy-0.39.1-linux-arm64.tar.gz"
      sha256 "ddbc22004666629437eddf0d38b87b4a9de5b63058067a8d29314e1f3dc1ac5d"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.39.1/mcpproxy-0.39.1-linux-amd64.tar.gz"
      sha256 "9adf1c9311e1a9857f18a84b9b3196ff05c6833e8a7568d8993cf30a405bfb75"
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
