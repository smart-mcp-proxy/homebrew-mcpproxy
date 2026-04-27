class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.27.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.27.1/mcpproxy-0.27.1-darwin-arm64.tar.gz"
      sha256 "f2edfec5ff3de55a8ad7f87f6be81fb2d71268f202854bc957c76365acfcfdf9"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.27.1/mcpproxy-0.27.1-darwin-amd64.tar.gz"
      sha256 "2796a021fa1c37edc1aa4877d90ee8eb9dd1e9738b47902a049602c6499f953a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.27.1/mcpproxy-0.27.1-linux-arm64.tar.gz"
      sha256 "03af160b6319cfca8a64375217244686452ba005a352267a816de1b69e05dd52"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.27.1/mcpproxy-0.27.1-linux-amd64.tar.gz"
      sha256 "d2a35cbdd62de85f2b05513056611138283e2900e9c9b15651c2c409ec23152a"
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
