class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.24.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.24.2/mcpproxy-0.24.2-darwin-arm64.tar.gz"
      sha256 "34e92eb6e894593bbf91623deac48e7254fc93a09f0929eef99c2af11e33a86a"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.24.2/mcpproxy-0.24.2-darwin-amd64.tar.gz"
      sha256 "3ab20c856205940d4b9d7df9216df38a473c4db2cc5efa4ab31b3d9a7207e7db"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.24.2/mcpproxy-0.24.2-linux-arm64.tar.gz"
      sha256 "d7866a73cdf46aa0f1352e7a089fa29c7fa148b8c01ade40fa5ee1514ccafdec"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.24.2/mcpproxy-0.24.2-linux-amd64.tar.gz"
      sha256 "3cb9481ebf53d8e251ab1ff042a6be62b71842286c54b93a858eed9df64aa147"
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
