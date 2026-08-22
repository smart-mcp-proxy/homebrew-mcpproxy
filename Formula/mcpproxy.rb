class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.60.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.60.0/mcpproxy-0.60.0-darwin-arm64.tar.gz"
      sha256 "4714e18e8152375c1c4a98eaf72ba1f669b49da8788b080574eca5e3254b4284"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.60.0/mcpproxy-0.60.0-darwin-amd64.tar.gz"
      sha256 "7ec3fd6a196461a8999c5b38642f259f69e86d845ef487966bc590ea94bd5a45"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.60.0/mcpproxy-0.60.0-linux-arm64.tar.gz"
      sha256 "8ddb756a7938d903a70abfa847bff936c80f443775db26f5e823d99beaa096e1"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.60.0/mcpproxy-0.60.0-linux-amd64.tar.gz"
      sha256 "fdff6f020a5b974d9e56ac4e3104f6019eb348449a066cc2496e3b7fa3f4b2da"
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
