class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.22.1-rc.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.22.1-rc.6/mcpproxy-0.22.1-rc.6-darwin-arm64.tar.gz"
      sha256 "8379546e56a109fd7456c9cb2be852e1c6b53a4306b961d95838e42375bbe2d7"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.22.1-rc.6/mcpproxy-0.22.1-rc.6-darwin-amd64.tar.gz"
      sha256 "9eab8403fff11f5c435635af835973e433fd2a7a1cff2a08c8a97d53926da913"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.22.1-rc.6/mcpproxy-0.22.1-rc.6-linux-arm64.tar.gz"
      sha256 "d85ccfc4d56fd0eb5c339c3b831e6262101f49606ae47f4a50048c06525ba130"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.22.1-rc.6/mcpproxy-0.22.1-rc.6-linux-amd64.tar.gz"
      sha256 "6e3283fa010507906986681ecda85996174b388cfe28ac542633880a310f9d55"
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
