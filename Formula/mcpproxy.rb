class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.30.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.30.1/mcpproxy-0.30.1-darwin-arm64.tar.gz"
      sha256 "2073b193edf620298fc32175baba3482e57cda7c120b48bac0f48090c859e5ed"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.30.1/mcpproxy-0.30.1-darwin-amd64.tar.gz"
      sha256 "db0c390506a86aa28c66ec0d4dd371d3c029fa74019d13a68c277f482424e388"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.30.1/mcpproxy-0.30.1-linux-arm64.tar.gz"
      sha256 "fc8974bae572cc40045093171f14fc1d6d1fda2f38113ad959e13f705c349888"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.30.1/mcpproxy-0.30.1-linux-amd64.tar.gz"
      sha256 "b5a3463593d211d9499a07293f934bf4312bf6a057ee1711993a11810b599557"
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
