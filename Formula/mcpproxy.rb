class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.33.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.33.2/mcpproxy-0.33.2-darwin-arm64.tar.gz"
      sha256 "4757b8bc3ddb3d1ce2a7e0454836f0ca39039ecd857105c7fbf04d251fb26ede"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.33.2/mcpproxy-0.33.2-darwin-amd64.tar.gz"
      sha256 "e2bace7038448549bbd2b973dd603b19cabd2ae30aa5ffd98d22dc820ae45af9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.33.2/mcpproxy-0.33.2-linux-arm64.tar.gz"
      sha256 "827f31fa236f3dd33fe850c7772042a73dcafa580c4ea7575697988e5486147a"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.33.2/mcpproxy-0.33.2-linux-amd64.tar.gz"
      sha256 "b0f6a4f6102433750324684c79335428a92a008ab9209b501ce32b54b1770017"
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
