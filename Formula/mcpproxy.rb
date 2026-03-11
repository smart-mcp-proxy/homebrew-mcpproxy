class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.21.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.21.2/mcpproxy-0.21.2-darwin-arm64.tar.gz"
      sha256 "ef235feea43d79825ff69da2f37523e9a2c89664b5bd144d0bf366d5d77d7b33"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.21.2/mcpproxy-0.21.2-darwin-amd64.tar.gz"
      sha256 "8c6d3f6b28485265ab6507a0583b2522ef68d9af56a60f02634c42355588f643"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.21.2/mcpproxy-0.21.2-linux-arm64.tar.gz"
      sha256 "14ad910efcc54106219757758524d247c1791bc819fda5bed2283620e26b0a6f"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.21.2/mcpproxy-0.21.2-linux-amd64.tar.gz"
      sha256 "0f80e4a29ef1b687a459cb627415010d199a68a7ec79dc687ee2d1420516f56c"
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
