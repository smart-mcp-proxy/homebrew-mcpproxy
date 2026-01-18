class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.14.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.14.0/mcpproxy-0.14.0-darwin-arm64.tar.gz"
      sha256 "a7b7d17cd2bd92f7c7ee1bce52037c3ff1ef5cd3c3ce58668e38fdee0d866b87"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.14.0/mcpproxy-0.14.0-darwin-amd64.tar.gz"
      sha256 "c57a6effbf268af0341267e91b132df6942586497a3b84cdeb0a1536a93d2268"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.14.0/mcpproxy-0.14.0-linux-arm64.tar.gz"
      sha256 "98d670e7e3570635e4997453fbc2f915c767edd066771296973a6eb3509c4293"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.14.0/mcpproxy-0.14.0-linux-amd64.tar.gz"
      sha256 "5a12029a963d20c058ef2da6a55a0cee395342d745419517939d7eee09352679"
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
