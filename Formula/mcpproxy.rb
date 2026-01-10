class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for Model Context Protocol servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  url "https://github.com/smart-mcp-proxy/mcpproxy-go/archive/refs/tags/v0.13.0.tar.gz"
  sha256 "eadda7158fea940bd2780ce113f083de8368b4aa40b6dc4518c757f3c62347be"
  license "MIT"
  head "https://github.com/smart-mcp-proxy/mcpproxy-go.git"

  depends_on "go" => :build

  def install
    system "go", "build", "-ldflags", "-s -w -X mcpproxy-go/cmd/mcpproxy.version=v0.13.0 -X main.version=v0.13.0 -X mcpproxy-go/internal/httpapi.buildVersion=v0.13.0", "-o", "mcpproxy", "./cmd/mcpproxy"
    bin.install "mcpproxy"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mcpproxy --version")
  end
end
