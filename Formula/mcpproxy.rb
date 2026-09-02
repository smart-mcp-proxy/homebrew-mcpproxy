class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.64.0/mcpproxy-0.64.0-darwin-arm64.tar.gz"
      sha256 "07c7147e70782717598064730832695074ced98d2f74a51cc419de0404753e99"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.64.0/mcpproxy-0.64.0-darwin-amd64.tar.gz"
      sha256 "ee80bbf37e6b9a9713d8095b4a42a17cea01760d533d530eeee6c3e307b118f9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.64.0/mcpproxy-0.64.0-linux-arm64.tar.gz"
      sha256 "b67da62cc27e1775ff7e4fb86e0f975300932f2e8e9ecd111000ac8bc5ddddd6"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.64.0/mcpproxy-0.64.0-linux-amd64.tar.gz"
      sha256 "65726a9c23c6a9f493367b15b1bc6992a01143cb178cc337e81b24eb1476a63e"
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
