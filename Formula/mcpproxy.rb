class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for Model Context Protocol servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  url "https://github.com/smart-mcp-proxy/mcpproxy-go/archive/refs/tags/v0.8.2.tar.gz"
  sha256 "5e6d10fd6962c6ad6e2de31f3312f38b2dc42ed3e9e180e0ca37286a7e557e8f"
  license "MIT"
  head "https://github.com/smart-mcp-proxy/mcpproxy-go.git"

  depends_on "go" => :build

  def install
    system "go", "build", "-ldflags", "-s -w -X mcpproxy-go/cmd/mcpproxy.version=v0.8.2 -X main.version=v0.8.2", "-o", "mcpproxy", "./cmd/mcpproxy"
    bin.install "mcpproxy"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mcpproxy --version")
  end
end
