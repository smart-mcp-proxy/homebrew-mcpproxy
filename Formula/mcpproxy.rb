class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.32.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.32.0/mcpproxy-0.32.0-darwin-arm64.tar.gz"
      sha256 "047894fc8bde34d6581e4b74514eee77cbc1bf9ec479451de11122bfc54a260c"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.32.0/mcpproxy-0.32.0-darwin-amd64.tar.gz"
      sha256 "98e96cff7261d283fc23e7e0cb6cc382ec371a17793f7192972cff38779173ac"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.32.0/mcpproxy-0.32.0-linux-arm64.tar.gz"
      sha256 "5d42fa639a0e65f761e0a7647860578bb4473ffa3dbe0bd62b8d4a182b1eff75"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.32.0/mcpproxy-0.32.0-linux-amd64.tar.gz"
      sha256 "e15bdb106eb3bc5a8e288dfb03a70ce596b50ca217693b1a364781abbf8037c6"
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
