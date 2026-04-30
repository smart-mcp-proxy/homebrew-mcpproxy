class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.29.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.29.2/mcpproxy-0.29.2-darwin-arm64.tar.gz"
      sha256 "88c0c596c5812552bafabadde9d7790b484d21f5b34edf4e9dccf02230866e6c"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.29.2/mcpproxy-0.29.2-darwin-amd64.tar.gz"
      sha256 "8f464c2ed08524703c5168be061d97e3d9af3b774569b9e201832417f929dd76"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.29.2/mcpproxy-0.29.2-linux-arm64.tar.gz"
      sha256 "0877a25f36968c7f1479df0c15484ac4ad3aacb50701d7995eb3e39736506b97"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.29.2/mcpproxy-0.29.2-linux-amd64.tar.gz"
      sha256 "be8a64089a3a7e56de1e03c25556ef366a99a19d0a169eab8dc1c7a8441a8da8"
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
