class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.45.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.45.0/mcpproxy-0.45.0-darwin-arm64.tar.gz"
      sha256 "8a42c99c0eac46e18e8be11d4b9257434f06457bb3da9954abcf1628bf46ca85"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.45.0/mcpproxy-0.45.0-darwin-amd64.tar.gz"
      sha256 "cc5eed7fab285f279acfde4312d4dfd808e2ad5164dea397feb1f4ecd0f03803"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.45.0/mcpproxy-0.45.0-linux-arm64.tar.gz"
      sha256 "3646c6ae44f8d630462102fa5f94997bd5226a7122fa5e699acd9b5322306574"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.45.0/mcpproxy-0.45.0-linux-amd64.tar.gz"
      sha256 "efbedba3125ec3e8ff315a5ed18d62aab46af0556ff7bd50da525a3576494471"
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
