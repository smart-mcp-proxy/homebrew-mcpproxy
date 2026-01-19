class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.15.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.15.3/mcpproxy-0.15.3-darwin-arm64.tar.gz"
      sha256 "59878790121a8f3c3aeb68edcbc4c8e277f06522d27a9a28d810a7a99649e0ca"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.15.3/mcpproxy-0.15.3-darwin-amd64.tar.gz"
      sha256 "bf07573d260d79cf7561cb2773fca4761efb62753ecc2c1567b1c15d19dbf5b5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.15.3/mcpproxy-0.15.3-linux-arm64.tar.gz"
      sha256 "d52f1ba8fffa4215c0364d2491e81b72ce74c7e24fde2c0f663da8970f73e8ff"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.15.3/mcpproxy-0.15.3-linux-amd64.tar.gz"
      sha256 "06823b9233a7997f127c943db9971b81e59f47cc2f6dfb0f948e6ec87fc55d66"
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
