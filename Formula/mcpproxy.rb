class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.24.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.24.5/mcpproxy-0.24.5-darwin-arm64.tar.gz"
      sha256 "d8a58089d69e2c7d497095169bd973958cfba836d2bfea0fbadffbfd2599878b"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.24.5/mcpproxy-0.24.5-darwin-amd64.tar.gz"
      sha256 "ffd6ead860cc5a6841566892bc3422c3813ea3dd922ff0902a5d429805af566b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.24.5/mcpproxy-0.24.5-linux-arm64.tar.gz"
      sha256 "08ba66e6c37fed185f860139662f254668014bee7225bf707ff6a4581411c82b"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.24.5/mcpproxy-0.24.5-linux-amd64.tar.gz"
      sha256 "8822cdba393f668752fcbba5bf01a767f9b9fc166234ec9544cf5ec9bd183632"
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
