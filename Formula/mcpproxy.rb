class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.43.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.43.1/mcpproxy-0.43.1-darwin-arm64.tar.gz"
      sha256 "a36187c283b8de871df27e6201271893f5d9f13d685904965839ef4e77ac021a"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.43.1/mcpproxy-0.43.1-darwin-amd64.tar.gz"
      sha256 "3527534351139f3306ad826ab81ac56701e48250ca52cb113d068720eda731b1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.43.1/mcpproxy-0.43.1-linux-arm64.tar.gz"
      sha256 "50661b2f0c5873b1042cc0454cd8c38ee3a5e3ed73fdaedc94fa81cb2cbfafd9"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.43.1/mcpproxy-0.43.1-linux-amd64.tar.gz"
      sha256 "d54c2d52b0a4a541fc4c62414f663f9b4c60c0d0ec05332a674f08570b2d457d"
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
