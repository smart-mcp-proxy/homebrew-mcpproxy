class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.23.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.23.2/mcpproxy-0.23.2-darwin-arm64.tar.gz"
      sha256 "83e0e32566b233a211392e598accc2a9c01ad4efb860db31ac32eb2057c04d06"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.23.2/mcpproxy-0.23.2-darwin-amd64.tar.gz"
      sha256 "bb71e76508ae17f7051fb0599b779708562719515bcb0d4348494dd986530b26"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.23.2/mcpproxy-0.23.2-linux-arm64.tar.gz"
      sha256 "cf952874df73ca340420eaf71d8149023c25d46794aab903c34cc46923ad27a3"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.23.2/mcpproxy-0.23.2-linux-amd64.tar.gz"
      sha256 "a3ac1f325288ebaf1286020d76135c1657d348e8e202f7da5918045681b9bd20"
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
