class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.29.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.29.5/mcpproxy-0.29.5-darwin-arm64.tar.gz"
      sha256 "4900d707f045d1a4bd48813ffd1b7e7ebb667350b4925b6a76aa32e6bb1ae83c"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.29.5/mcpproxy-0.29.5-darwin-amd64.tar.gz"
      sha256 "5619232f98dfac123d7d9dfb99aed6300cdad42cf88b8db9830451a3406770e9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.29.5/mcpproxy-0.29.5-linux-arm64.tar.gz"
      sha256 "14ff75a4ab9fdae4c18c738c715d806661108259db8452132f674ef88dd9c6f7"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.29.5/mcpproxy-0.29.5-linux-amd64.tar.gz"
      sha256 "c2077e5b9e078165fc832ae752154d4c9362169d73914a208fb03827b72a64b6"
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
