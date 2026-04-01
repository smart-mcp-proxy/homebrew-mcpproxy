class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.23.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.23.0/mcpproxy-0.23.0-darwin-arm64.tar.gz"
      sha256 "dfe769f00664949f65815b3083487817f752e76d7480f8a0eae110e59f197443"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.23.0/mcpproxy-0.23.0-darwin-amd64.tar.gz"
      sha256 "a1c1634399b773cfc62511b537652fa55e0821b165c442b24f9c31dc13ede3cb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.23.0/mcpproxy-0.23.0-linux-arm64.tar.gz"
      sha256 "34b121ff8a163c878c0ab1585d360a0cd88a30caa97520d18f6b57408c99adbf"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.23.0/mcpproxy-0.23.0-linux-amd64.tar.gz"
      sha256 "f252cbc1ad54387e6677083d169332e78ba1021fe35b2c7b0654de087aeb78f4"
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
