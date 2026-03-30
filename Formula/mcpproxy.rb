class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.22.1-rc.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.22.1-rc.4/mcpproxy-0.22.1-rc.4-darwin-arm64.tar.gz"
      sha256 "d363e5c580ff6a9f4be3eedcf8a4d176d764a62c52b109ab85063fc987e67fd3"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.22.1-rc.4/mcpproxy-0.22.1-rc.4-darwin-amd64.tar.gz"
      sha256 "56374a55fdf2930df0dbc13990eb5056b840a1a6c20f9de9ce7dd76bbd2e614d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.22.1-rc.4/mcpproxy-0.22.1-rc.4-linux-arm64.tar.gz"
      sha256 "9aecfed91cff93b59452b4023e5587fc7e868f2c4ba3720520b4a78cf03a9d62"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.22.1-rc.4/mcpproxy-0.22.1-rc.4-linux-amd64.tar.gz"
      sha256 "e50a6d20a16943a97fcb4371a7d05f67b71ceefbdc706f00cf0d91175f7d3fa7"
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
