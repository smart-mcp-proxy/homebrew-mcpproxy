class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for Model Context Protocol servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  url "https://github.com/smart-mcp-proxy/mcpproxy-go/archive/refs/tags/v0.8.1.tar.gz"
  sha256 "b3314456f2e21c0ea18f5e73a5bff00ca4393d292f7ac0699dfa5ac0b07af9aa"
  license "MIT"
  head "https://github.com/smart-mcp-proxy/mcpproxy-go.git"

  depends_on "go" => :build

  def install
    system "go", "build", "-ldflags", "-s -w -X mcpproxy-go/cmd/mcpproxy.version=v0.8.1 -X main.version=v0.8.1", "-o", "mcpproxy", "./cmd/mcpproxy"
    bin.install "mcpproxy"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mcpproxy --version")
  end
end
