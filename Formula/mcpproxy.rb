class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.17.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.17.0/mcpproxy-0.17.0-darwin-arm64.tar.gz"
      sha256 "544a7b1a9f7dbd3717308e8a272f5c4409c8214c4461015e6fb2b2528eefdfcd"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.17.0/mcpproxy-0.17.0-darwin-amd64.tar.gz"
      sha256 "9f1d4a49615787c93159fdb5bd939fe56185ba775deeb587a29d4ffa488cd54f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.17.0/mcpproxy-0.17.0-linux-arm64.tar.gz"
      sha256 "bf4253a4ec626ede8942801cced87f811db5be2f3d2ac58bbf473601f0765ca7"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.17.0/mcpproxy-0.17.0-linux-amd64.tar.gz"
      sha256 "7f8dc66141348a7437c5dce4070a522ab0d100d7c5fe21894be4700c0f69a900"
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
