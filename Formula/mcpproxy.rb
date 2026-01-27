class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.16.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.16.5/mcpproxy-0.16.5-darwin-arm64.tar.gz"
      sha256 "7957ffda5c24a08da4ee9c7cc53e3f21de00088501c9a2ca80c93c5f0be4769d"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.16.5/mcpproxy-0.16.5-darwin-amd64.tar.gz"
      sha256 "f84f1ecc78999f581e448a4ada8cc50592124a95946764c1dbadfa68a89fa0af"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.16.5/mcpproxy-0.16.5-linux-arm64.tar.gz"
      sha256 "37721b9236cc7616281aace136bbacce4805a6e41b5a5ac7a7bbf51a128922e4"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.16.5/mcpproxy-0.16.5-linux-amd64.tar.gz"
      sha256 "cf205539e2b0d135a4cd02a4ac66ebf6826324fc2b4a37027edb9f15aebd271f"
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
