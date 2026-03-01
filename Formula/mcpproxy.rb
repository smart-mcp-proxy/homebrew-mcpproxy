class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.18.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.18.1/mcpproxy-0.18.1-darwin-arm64.tar.gz"
      sha256 "c539bd3adba4d6435602ed5d49306347b1e8a404ce77c886207177251adf3582"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.18.1/mcpproxy-0.18.1-darwin-amd64.tar.gz"
      sha256 "e34453b43d695eb4ea919aaf7101f0ca228f1290ae3695706af742837ce668cd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.18.1/mcpproxy-0.18.1-linux-arm64.tar.gz"
      sha256 "b1ae5e44b8c49426d2ee14572b469ad8d491683f8ca568d6230596f2e21016ea"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.18.1/mcpproxy-0.18.1-linux-amd64.tar.gz"
      sha256 "08ce6ab6c38b3341f21f3a8e0ebafd9212c9d3809761ddef7d5ca20d81be508e"
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
