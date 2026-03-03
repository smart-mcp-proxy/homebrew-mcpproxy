class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.19.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.19.0/mcpproxy-0.19.0-darwin-arm64.tar.gz"
      sha256 "9cc4e1c363e19924c7081401a2599ddb116e48df64179ac89848da8c453068e4"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.19.0/mcpproxy-0.19.0-darwin-amd64.tar.gz"
      sha256 "951116c329f183c3a34ac71959706a7a87a661ef2984e088499dd81a91942af8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.19.0/mcpproxy-0.19.0-linux-arm64.tar.gz"
      sha256 "0508b73de989f85ab5dae1f38311edf2ae5cd0d2b8405e747a3c0136f86b7f25"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.19.0/mcpproxy-0.19.0-linux-amd64.tar.gz"
      sha256 "025cee6dfe625796e25a731be57a58ce5a94a0bab4edc8fad5a89969413dd82c"
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
