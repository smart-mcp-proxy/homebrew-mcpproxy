class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.16.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.16.4/mcpproxy-0.16.4-darwin-arm64.tar.gz"
      sha256 "1d200cf6f795290e96eaaf23964ef5f6f9dfd6090d0978e75c2fe43217ca3225"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.16.4/mcpproxy-0.16.4-darwin-amd64.tar.gz"
      sha256 "80230ed9b612296e95bbbf61c0da1e4bc60c08317e35d49216d332f81e034d1a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.16.4/mcpproxy-0.16.4-linux-arm64.tar.gz"
      sha256 "b1c6b329bbc94ded9abe39141f9b691c2ac4f27251a81fc401d5185aaf066487"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.16.4/mcpproxy-0.16.4-linux-amd64.tar.gz"
      sha256 "b2bdcf9b33d28c07189afce6d07b2ed190da35d86c07171d7ab51fea4fa8b5bd"
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
