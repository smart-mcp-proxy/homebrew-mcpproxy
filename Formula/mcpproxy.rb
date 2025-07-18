class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for Model Context Protocol servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  url "https://github.com/smart-mcp-proxy/mcpproxy-go/archive/refs/tags/v0.6.3.tar.gz"
  sha256 "846181ca4176b8fe6e9cb72bd949320a2b722922515fcbb93f88f5e254c3697e"
  license "MIT"
  head "https://github.com/smart-mcp-proxy/mcpproxy-go.git"

  depends_on "go" => :build

  def install
    system "go", "build", "-ldflags", "-s -w -X mcpproxy-go/cmd/mcpproxy.version=v0.6.3 -X main.version=v0.6.3", "-o", "mcpproxy", "./cmd/mcpproxy"
    bin.install "mcpproxy"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mcpproxy --version")
  end
end
