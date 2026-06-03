class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.36.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.36.0/mcpproxy-0.36.0-darwin-arm64.tar.gz"
      sha256 "a9ad07c8bbf4aec035ffb2826a3c18b68768e4bfa762fff087679e154273d39e"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.36.0/mcpproxy-0.36.0-darwin-amd64.tar.gz"
      sha256 "8cfc903f34b1efd77cc3d81934007f250d36623b3208685c05829aadd0e4f593"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.36.0/mcpproxy-0.36.0-linux-arm64.tar.gz"
      sha256 "11ec673ef7e6e1301cdd5777a1fedf6fe3cec7f3f125f42a212f242ab2f32b25"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.36.0/mcpproxy-0.36.0-linux-amd64.tar.gz"
      sha256 "cec1a8a05660a67ee5987a098e3aa15745adeba881138eb54dab622c64e070da"
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
