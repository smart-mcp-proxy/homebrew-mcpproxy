class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.16.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.16.7/mcpproxy-0.16.7-darwin-arm64.tar.gz"
      sha256 "4b90c37543b0a9c0b0d889ba298dafa527ab72f1d821406aa7b56d4b6c316caf"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.16.7/mcpproxy-0.16.7-darwin-amd64.tar.gz"
      sha256 "53a5c29d183c3e071bbc3fb65ec25dab04e0f4dd529bf1946c75a5f1fcece11a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.16.7/mcpproxy-0.16.7-linux-arm64.tar.gz"
      sha256 "356b56a4815443fe8adea58c8c68977b3669c71251aece3727c8be62e0059a7a"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.16.7/mcpproxy-0.16.7-linux-amd64.tar.gz"
      sha256 "bff2f83c7aefa071a1e652062106573b675d0843dfd5a4b7dcceb7167b4087e8"
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
