class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for Model Context Protocol servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  url "https://github.com/smart-mcp-proxy/mcpproxy-go/archive/refs/tags/v0.10.7.tar.gz"
  sha256 "87bee11c9401c12633f8784123cb0858bd632c35274a511c9208c68ccf02443d"
  license "MIT"
  head "https://github.com/smart-mcp-proxy/mcpproxy-go.git"

  depends_on "go" => :build

  def install
    system "go", "build", "-ldflags", "-s -w -X mcpproxy-go/cmd/mcpproxy.version=v0.10.7 -X main.version=v0.10.7", "-o", "mcpproxy", "./cmd/mcpproxy"
    bin.install "mcpproxy"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mcpproxy --version")
  end
end
