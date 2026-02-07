class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.17.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.17.4/mcpproxy-0.17.4-darwin-arm64.tar.gz"
      sha256 "b468c96151d6bab56b1c6f63168517910c452214ea91e2369f2d09cf9baa8a6b"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.17.4/mcpproxy-0.17.4-darwin-amd64.tar.gz"
      sha256 "5242efda8e08fbe9d65c943fb66e597192de3f4fec49a685a97eeabf1314c30e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.17.4/mcpproxy-0.17.4-linux-arm64.tar.gz"
      sha256 "81df724267f1e0f29a55971ef0cf6a2bb7840a965a0d22635587ad44007c0cd9"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.17.4/mcpproxy-0.17.4-linux-amd64.tar.gz"
      sha256 "0faf2c1c5189b6b63f9c3111a62db35944edb73bf435a4cbe34d3f6f01be98a2"
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
