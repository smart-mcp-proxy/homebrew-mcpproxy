class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.26.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.26.2/mcpproxy-0.26.2-darwin-arm64.tar.gz"
      sha256 "c110213cc88c0855b12dfe4ea6b9700235e8f5bb4d2af4ff2c713947f9dd4f14"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.26.2/mcpproxy-0.26.2-darwin-amd64.tar.gz"
      sha256 "31f7731a2a14bb7f2e623f15d45b0f8a66183186416a57d434802aa1779a0a0b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.26.2/mcpproxy-0.26.2-linux-arm64.tar.gz"
      sha256 "393d5a5eeae52b9ccc4a3a6a8a98ad9eeeab5fa46f856c8758563f403fc3baf0"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.26.2/mcpproxy-0.26.2-linux-amd64.tar.gz"
      sha256 "048bc296f18ce1b9e4640d9ce3ab714f7613c7aaffdd85f899726d92680dd09f"
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
