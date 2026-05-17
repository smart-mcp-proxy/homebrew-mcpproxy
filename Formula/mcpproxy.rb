class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.31.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.31.1/mcpproxy-0.31.1-darwin-arm64.tar.gz"
      sha256 "035e1cad4e835740437141490d0ff73734a955455d380fb1aaf48869d4da4478"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.31.1/mcpproxy-0.31.1-darwin-amd64.tar.gz"
      sha256 "c4827e5a7a80985a6ce9fac52dd9bc69b4b5a7cd9858cda6824dbaf06a6698fa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.31.1/mcpproxy-0.31.1-linux-arm64.tar.gz"
      sha256 "b79f42df94f90fb32bf96fac12af0deb5edab8356a3222eadafe7686df0c49fe"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.31.1/mcpproxy-0.31.1-linux-amd64.tar.gz"
      sha256 "949cab23c10b4641be2e8628f779931305adbfcaca2c818872ecbc53bf59059a"
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
