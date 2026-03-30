class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.22.1-rc.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.22.1-rc.3/mcpproxy-0.22.1-rc.3-darwin-arm64.tar.gz"
      sha256 "da1b9905eb3dcae460bf6acfb42a73b4e029126bbd3de8cd5004c1580188f42f"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.22.1-rc.3/mcpproxy-0.22.1-rc.3-darwin-amd64.tar.gz"
      sha256 "09acffadb01fc851b3000ff64461cc6ae2155878517899468ef0af8301697397"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.22.1-rc.3/mcpproxy-0.22.1-rc.3-linux-arm64.tar.gz"
      sha256 "3e5e1603690e26151a94892cd5c601c1f68a36ae186d2b0181d3a94db04e3d36"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.22.1-rc.3/mcpproxy-0.22.1-rc.3-linux-amd64.tar.gz"
      sha256 "8ad22fec53debdd39ebdb3022d5f452a6488110bd7251bb5a1abb88ad8a17e14"
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
