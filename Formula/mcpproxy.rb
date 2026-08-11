class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.55.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.55.0/mcpproxy-0.55.0-darwin-arm64.tar.gz"
      sha256 "6d44c98789b08df87718e26377b9a3b4ca16faa5b2414f4ba2a18e06a32cccf3"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.55.0/mcpproxy-0.55.0-darwin-amd64.tar.gz"
      sha256 "ccad8d273d8901ed40180d003e74a1d5bd7c94b8729f262b6dd9fe2d34f8f2e4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.55.0/mcpproxy-0.55.0-linux-arm64.tar.gz"
      sha256 "a08e4c4745355faf0c17b71f38e91d8191dde26143bf2d9c2da9052242c1dc6b"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.55.0/mcpproxy-0.55.0-linux-amd64.tar.gz"
      sha256 "420762173ba2714c18bb3840d115639fbd850fe92a093db53c1e24fdf5927d40"
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
