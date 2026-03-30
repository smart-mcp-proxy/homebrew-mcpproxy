class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.22.1-rc.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.22.1-rc.2/mcpproxy-0.22.1-rc.2-darwin-arm64.tar.gz"
      sha256 "89abdef08a9f665c555b04f9eb0731de1bbf4a0b2fd050dfbe94444877e8ad24"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.22.1-rc.2/mcpproxy-0.22.1-rc.2-darwin-amd64.tar.gz"
      sha256 "ebd1265760da9546ca14bdd73da4c307274e455c14382282b04cb437bd7af4c7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.22.1-rc.2/mcpproxy-0.22.1-rc.2-linux-arm64.tar.gz"
      sha256 "f9d6ab0b2cf6a647684ee7c17457584ede20d07b4c40a1d4f9ed2ba8292c52ed"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.22.1-rc.2/mcpproxy-0.22.1-rc.2-linux-amd64.tar.gz"
      sha256 "1abb7801e9838e89e24b6d60a0fb57fe1d5e28e982aef7263370ba76d08e316d"
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
