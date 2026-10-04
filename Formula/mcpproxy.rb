class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.70.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.70.0/mcpproxy-0.70.0-darwin-arm64.tar.gz"
      sha256 "077d2ec0c783aa7bf0f724fec6e257018320d07abfa051315bf2f12a17e1eaf7"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.70.0/mcpproxy-0.70.0-darwin-amd64.tar.gz"
      sha256 "8c2e3016f3f21e1482e74b92e12179ab6044eb0d36ba7661816b175ed33c5366"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.70.0/mcpproxy-0.70.0-linux-arm64.tar.gz"
      sha256 "2b5ac88adf71c4a20ed8e4deaaed5b5190cbc9623a1f25b8d587076af04d230d"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.70.0/mcpproxy-0.70.0-linux-amd64.tar.gz"
      sha256 "97bdf9385105553cc609a9a49b21513ac38c0d815152f3d58e684544924a2699"
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
