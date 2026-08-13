class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.56.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.56.0/mcpproxy-0.56.0-darwin-arm64.tar.gz"
      sha256 "43e4f98e3f7c5898b8de88126bb71ac398544d841c821ef601c7056f7df6e70a"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.56.0/mcpproxy-0.56.0-darwin-amd64.tar.gz"
      sha256 "a996ef703b6c39ab0983930459192546288d1931dc02ff8406c6f695fd5292c8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.56.0/mcpproxy-0.56.0-linux-arm64.tar.gz"
      sha256 "f0ed69fe281630534a1a6ff26a026a1ca7719d3a28e0045e90c0516e67f20aa1"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.56.0/mcpproxy-0.56.0-linux-amd64.tar.gz"
      sha256 "a2614ae600ee0a0706b9bd7668ec2d7105f2f6e47f57f78b0295d16aefb3e480"
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
