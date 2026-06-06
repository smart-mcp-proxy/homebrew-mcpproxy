class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.38.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.38.0/mcpproxy-0.38.0-darwin-arm64.tar.gz"
      sha256 "e948fb1e9dc44150b536a7e2071067bcec3eea70dd1fb825756aee151b27f59f"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.38.0/mcpproxy-0.38.0-darwin-amd64.tar.gz"
      sha256 "83d67598eca3141b011c2352a0942e18f8346bf08050bbf98af7f5bd54403710"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.38.0/mcpproxy-0.38.0-linux-arm64.tar.gz"
      sha256 "78bc8d79ed2676bcb27a229a10b7870d9cd22cd4a97a46f282e95f0db443b6f4"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.38.0/mcpproxy-0.38.0-linux-amd64.tar.gz"
      sha256 "45ac90c6ea47d707c11e7597e43be3648718a3039bb3e0e5d7bb35ca559d75fd"
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
