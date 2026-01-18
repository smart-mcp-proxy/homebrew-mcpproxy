class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.15.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.15.0/mcpproxy-0.15.0-darwin-arm64.tar.gz"
      sha256 "ead698d92ac9b3dfc1d6489d49ec2a16c5338785a9e5109afaa8b3145ca073f7"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.15.0/mcpproxy-0.15.0-darwin-amd64.tar.gz"
      sha256 "554ce740dbace742814caec6c03c7dcf4f7c3b7f37c28ed7ba09ffcfced635b1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.15.0/mcpproxy-0.15.0-linux-arm64.tar.gz"
      sha256 "5ac513493a197cbab821f2bdee01fe19b6e25188c6663207b8d04b7095705fe5"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.15.0/mcpproxy-0.15.0-linux-amd64.tar.gz"
      sha256 "79e1bbe2161c4c0bb334321ff64ccab72390b7042828b3a13ff0c4cd0620c0ef"
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
