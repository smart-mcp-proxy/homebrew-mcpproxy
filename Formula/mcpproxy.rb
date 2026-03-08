class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.20.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.20.1/mcpproxy-0.20.1-darwin-arm64.tar.gz"
      sha256 "c020c03c14d6f95f53e39c7b9d942b03aaa27f5d7100294be228644aa897b4db"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.20.1/mcpproxy-0.20.1-darwin-amd64.tar.gz"
      sha256 "394190c005c529a33960e5a422f53d8a02ba6f01706fcc62efe295baa3de47e4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.20.1/mcpproxy-0.20.1-linux-arm64.tar.gz"
      sha256 "adbee5709298c137b7849c1ee3c9c7c61f0cfceec4792a56581693937f99def5"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.20.1/mcpproxy-0.20.1-linux-amd64.tar.gz"
      sha256 "de6e09cd0d871ef65131ebab5461344641e8181225866a9a66b38d1a9d61a2a1"
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
