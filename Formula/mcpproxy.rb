class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.41.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.41.1/mcpproxy-0.41.1-darwin-arm64.tar.gz"
      sha256 "8c294e080a15d28107f2264ce5f69d985908d2d7eaeae714e0e532d0e42c843e"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.41.1/mcpproxy-0.41.1-darwin-amd64.tar.gz"
      sha256 "a19d0ec7ab468afa098ce7f462711e421d16b0e0f0e1f2b2ec24d89dbfd439e2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.41.1/mcpproxy-0.41.1-linux-arm64.tar.gz"
      sha256 "0ec471a46dc057111681f0a775052bcb40cac9d17dfb6be71c7368440a349247"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.41.1/mcpproxy-0.41.1-linux-amd64.tar.gz"
      sha256 "c4d49d1a62b4895e2d29d403f454e9b0d819149e2508bef06a7592a93bdb14bf"
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
