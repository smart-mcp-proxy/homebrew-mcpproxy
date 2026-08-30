class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.63.0/mcpproxy-0.63.0-darwin-arm64.tar.gz"
      sha256 "448b9d955ec04be36705698f6901fc73d577ad8c8c1c0eb12e8006bb45e1a9d0"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.63.0/mcpproxy-0.63.0-darwin-amd64.tar.gz"
      sha256 "2af94c2b9fc0941a8a2b9ce561ec6ead219045881b9b865e6c59d6f77d57404c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.63.0/mcpproxy-0.63.0-linux-arm64.tar.gz"
      sha256 "c8513245fb001a4141bf7357f34f058e2f08a8037f046c0749f7461ec2145314"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.63.0/mcpproxy-0.63.0-linux-amd64.tar.gz"
      sha256 "d29a4c980559a1798e4f2322bb9616893ce5f951009f16d2999bccd519145507"
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
