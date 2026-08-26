class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.61.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.61.0/mcpproxy-0.61.0-darwin-arm64.tar.gz"
      sha256 "549d9b56d035fa18f22ba00219363cf9c8a38637da33d4e66d410a7153fc9861"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.61.0/mcpproxy-0.61.0-darwin-amd64.tar.gz"
      sha256 "1acbbe2b5636a3e75024a5f630e26ca473a68d9d09f30105021dce6983c15532"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.61.0/mcpproxy-0.61.0-linux-arm64.tar.gz"
      sha256 "dc67df651eedce4890f1616546265682b9c3dbdd581ec3f1c90118a17bc2f127"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.61.0/mcpproxy-0.61.0-linux-amd64.tar.gz"
      sha256 "6a468db2d4e2a32b3fd19a25883532890ca21d04b9fccd2832d21dce3a1b3604"
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
