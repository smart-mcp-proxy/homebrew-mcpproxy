class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.17.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.17.1/mcpproxy-0.17.1-darwin-arm64.tar.gz"
      sha256 "a98e845f8a8cb632e08eec22a005d86b8bc0d34ad96854bdf09fc34046fdaa04"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.17.1/mcpproxy-0.17.1-darwin-amd64.tar.gz"
      sha256 "d2ded2d9f7050abbb9ff85f58fd76ac3af165017241888c1f1d26f96c3c15fa2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.17.1/mcpproxy-0.17.1-linux-arm64.tar.gz"
      sha256 "fc6062388929050679cfd1fcd13017c9a225ce47697935c1316d8176fca31506"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.17.1/mcpproxy-0.17.1-linux-amd64.tar.gz"
      sha256 "aa5e8c063feac7a11cb167edbd11be400da2da0c0d15f0d57b9ed5a83aa2b5b6"
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
