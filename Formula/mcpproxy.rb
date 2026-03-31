class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.22.1-rc.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.22.1-rc.7/mcpproxy-0.22.1-rc.7-darwin-arm64.tar.gz"
      sha256 "23a7a27a63c30f16ac6e7227d014c23e42790bea9a46ad01df5c465883fe224d"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.22.1-rc.7/mcpproxy-0.22.1-rc.7-darwin-amd64.tar.gz"
      sha256 "ded59a653ec6dc375493e76431b40badc8990b0e97e0154e2a55b9d9f400ebd2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.22.1-rc.7/mcpproxy-0.22.1-rc.7-linux-arm64.tar.gz"
      sha256 "6817a5c15884bd0a1a1c92337ccbc0526fc9f96fa96fd3c553d2c3902dad30df"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.22.1-rc.7/mcpproxy-0.22.1-rc.7-linux-amd64.tar.gz"
      sha256 "4d4278c841d38624ab1cd882a771b2dd74b7e0615aa1238fffebd03d55ee99d3"
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
