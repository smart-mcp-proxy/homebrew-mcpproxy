class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.15.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.15.1/mcpproxy-0.15.1-darwin-arm64.tar.gz"
      sha256 "35c64a8ca939024d8674f1bed67cd24f7574f92f303c87cde43fd9d668eced01"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.15.1/mcpproxy-0.15.1-darwin-amd64.tar.gz"
      sha256 "d307150094d780e8d4ee9fc3e94871418f4a8542958790c0bea4b63e3fcf8f72"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.15.1/mcpproxy-0.15.1-linux-arm64.tar.gz"
      sha256 "a05c81bb1091a1cf3a2122d7180aa6a24eab1a902fde5820d26b7548cb4e99af"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.15.1/mcpproxy-0.15.1-linux-amd64.tar.gz"
      sha256 "9284406c6060fb59dcf48ffdaf558e9ed83a2489706099cb3beecef20f250e96"
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
