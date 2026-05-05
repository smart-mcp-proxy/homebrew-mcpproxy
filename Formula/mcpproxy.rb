class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.29.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.29.3/mcpproxy-0.29.3-darwin-arm64.tar.gz"
      sha256 "eb442526f9abc71e79dc50902ab0fc4d04909cab3300cc14387e46ba3b0740f6"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.29.3/mcpproxy-0.29.3-darwin-amd64.tar.gz"
      sha256 "f8f80bc97e7651007f0a788149f1fa39bcc636ae21abbbeddbf487afe4857cb9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.29.3/mcpproxy-0.29.3-linux-arm64.tar.gz"
      sha256 "e6f889a00caa0eb6f50cff7d872d6b8ae595503ca90c5cd4f87ca58260e3b47e"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.29.3/mcpproxy-0.29.3-linux-amd64.tar.gz"
      sha256 "b1a71ab27aad8ea42d59aae2aa3bda0fe4fe817b82cdea542453b997f90ebfaf"
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
