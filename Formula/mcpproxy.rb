class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.23.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.23.1/mcpproxy-0.23.1-darwin-arm64.tar.gz"
      sha256 "c0c771c5285f39f1fea4ca512ef67d4ef0a3753f400b3f78be30a82146d03339"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.23.1/mcpproxy-0.23.1-darwin-amd64.tar.gz"
      sha256 "68c7f2e1bc86853120ef3c11c361f680e4ca20eadd1fc5d54b21e9db07f703dd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.23.1/mcpproxy-0.23.1-linux-arm64.tar.gz"
      sha256 "a451b573b09f5b754676608949d4f58355d3955b53ef8efde9fbc79d65281de6"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.23.1/mcpproxy-0.23.1-linux-amd64.tar.gz"
      sha256 "ba68e1b5dd9fbad578ecd7657efd932e73d72016dc3246f6f477644f18e04e4f"
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
