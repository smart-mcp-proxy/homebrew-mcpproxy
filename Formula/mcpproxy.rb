class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.17.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.17.6/mcpproxy-0.17.6-darwin-arm64.tar.gz"
      sha256 "3884d90fd88a3d6dc0c922745953fbe53b0ee88e7b3abb96a09f2e05e2de890a"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.17.6/mcpproxy-0.17.6-darwin-amd64.tar.gz"
      sha256 "162cbf5332feac8ac451edd26ab2d48ecf63909fbda9157218de12c8a539b73c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.17.6/mcpproxy-0.17.6-linux-arm64.tar.gz"
      sha256 "a3ef4aeea908534f3b1d384502c19c2d2e7e741b8e1a543e03ea8858a7e69f0e"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.17.6/mcpproxy-0.17.6-linux-amd64.tar.gz"
      sha256 "e8db9985caa2a99f95860df75d04869f081fdbacfaba933c2658b065ed00a1c9"
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
