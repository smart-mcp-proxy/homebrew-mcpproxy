class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.53.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.53.0/mcpproxy-0.53.0-darwin-arm64.tar.gz"
      sha256 "9a7a6a0be660dc3e7b6389044abef199cca34c779074c581ea2fd5615b5a6de5"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.53.0/mcpproxy-0.53.0-darwin-amd64.tar.gz"
      sha256 "89143c423ed3db8be572def89c3dfa3988b99738dac95a4227e97f5f608b7f2a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.53.0/mcpproxy-0.53.0-linux-arm64.tar.gz"
      sha256 "0d8ebaeac517f8e1751426795b4c368cdfddb4a107b36614aba676375f07118b"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.53.0/mcpproxy-0.53.0-linux-amd64.tar.gz"
      sha256 "984135a28fe7c8b637289923e63df19a9d2d67843a416606f5e3b2c6ad1f0076"
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
