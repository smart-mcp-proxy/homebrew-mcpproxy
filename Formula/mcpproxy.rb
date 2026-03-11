class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.21.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.21.0/mcpproxy-0.21.0-darwin-arm64.tar.gz"
      sha256 "2604b71b1fa03ee5fb8ccdbb151c22ff52200f6ad64b3d569da5b8c8a3197ec6"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.21.0/mcpproxy-0.21.0-darwin-amd64.tar.gz"
      sha256 "46ff3eb0832dd4d7ce9f2db7bae7310b07e45be65830622f06a39e7daa4dfb5a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.21.0/mcpproxy-0.21.0-linux-arm64.tar.gz"
      sha256 "954d73d9d6dd25d5b8b67737a4de1e2efb246e8490653235abc9031a01b5dba5"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.21.0/mcpproxy-0.21.0-linux-amd64.tar.gz"
      sha256 "7fa58156998a824ee9172f94e8991bb4f702f6f664f2fd5d13f19cbd4fffe9f7"
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
