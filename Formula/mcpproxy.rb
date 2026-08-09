class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.54.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.54.1/mcpproxy-0.54.1-darwin-arm64.tar.gz"
      sha256 "87857b6ee603c02e81ed62597045a58ee72b7f77f00b3a7dda6802731ba5626d"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.54.1/mcpproxy-0.54.1-darwin-amd64.tar.gz"
      sha256 "0fe3310c7d3f07ea62a36d7a93c2548e3bb2e1d5b5c85b81204863859672fb8f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.54.1/mcpproxy-0.54.1-linux-arm64.tar.gz"
      sha256 "cf1927f96dc30ef4aa9f83cd72052abbe6a91926bb3f472dfcf984fce2561fb1"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.54.1/mcpproxy-0.54.1-linux-amd64.tar.gz"
      sha256 "9c1d35a232552d925c7117d6fd9bfcbf6239102aee3ce38343455d774c074ec5"
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
