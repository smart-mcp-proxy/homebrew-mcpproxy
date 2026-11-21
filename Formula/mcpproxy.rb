class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.75.0/mcpproxy-0.75.0-darwin-arm64.tar.gz"
      sha256 "cb258af4de168fbe0402805af034c24d660acc5f8831054938fb104a016418e6"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.75.0/mcpproxy-0.75.0-darwin-amd64.tar.gz"
      sha256 "738b2577d461e6d2ff74a90e479f039dd141fd4ef9dd4272518ced3d05726319"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.75.0/mcpproxy-0.75.0-linux-arm64.tar.gz"
      sha256 "0d1cd47622e3dee1c18702954e627638bbdd25f14f3913f2f056febee08d4ec0"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.75.0/mcpproxy-0.75.0-linux-amd64.tar.gz"
      sha256 "586d366958a87a9621e3605052f900cc05f21093ee71d433713642dd03c3fbe6"
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
