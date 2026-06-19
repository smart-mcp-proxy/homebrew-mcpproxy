class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.43.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.43.0/mcpproxy-0.43.0-darwin-arm64.tar.gz"
      sha256 "0854bb50ebcf67460db5f733ee54df377e57e710dca21a5591d3d37617410757"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.43.0/mcpproxy-0.43.0-darwin-amd64.tar.gz"
      sha256 "1a02ddf97116e5eef1f6c63e48191acc3a4ec26167236f10d8999da0eb14d7b6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.43.0/mcpproxy-0.43.0-linux-arm64.tar.gz"
      sha256 "c864e744c5f5e152427c6f4c1f4e266cf1e7e0d7e91c3b6f0b2acf828308ced5"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.43.0/mcpproxy-0.43.0-linux-amd64.tar.gz"
      sha256 "ce1c8ab598e5c92b8af3eeaa6c640be994d8839c6bdf9a7eceacd2250300635d"
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
