class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.22.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.22.0/mcpproxy-0.22.0-darwin-arm64.tar.gz"
      sha256 "0b0bd55ab6999f93ba602aaa1a8368276a3b08436cba57e3133b346649bcca82"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.22.0/mcpproxy-0.22.0-darwin-amd64.tar.gz"
      sha256 "627161afccea2acc4bddc5e6ed7e39766453c3541422bc5e8be33730ec6bf412"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.22.0/mcpproxy-0.22.0-linux-arm64.tar.gz"
      sha256 "bedeef90ea437a09ccca2786393254517d17d29ada050748545b8260fc2b2e23"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.22.0/mcpproxy-0.22.0-linux-amd64.tar.gz"
      sha256 "c6d820e6b756604e8f56ec2ecffafb0b7a39af9f97248f83c030d27681cb0e18"
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
