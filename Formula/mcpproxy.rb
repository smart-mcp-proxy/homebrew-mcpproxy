class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.22.1-rc.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.22.1-rc.8/mcpproxy-0.22.1-rc.8-darwin-arm64.tar.gz"
      sha256 "652434e2b90314408daf9952aa3a7df881b0b9001e14803c9de095f641a81210"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.22.1-rc.8/mcpproxy-0.22.1-rc.8-darwin-amd64.tar.gz"
      sha256 "f40835354350df5d305f54918fcdb9b935789a0bd78dafa23fa05ecd570b5484"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.22.1-rc.8/mcpproxy-0.22.1-rc.8-linux-arm64.tar.gz"
      sha256 "ef5f6a3b21c7758076a711e3c72b59da8e6ab2a5a220438717af367c4603cbaf"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.22.1-rc.8/mcpproxy-0.22.1-rc.8-linux-amd64.tar.gz"
      sha256 "9e4146dae89d8b9faee8832cb7221f1f65fbf264d21ff642c50b93a179154f84"
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
