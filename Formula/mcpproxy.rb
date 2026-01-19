class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.15.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.15.4/mcpproxy-0.15.4-darwin-arm64.tar.gz"
      sha256 "b772c5ae74bea58f5ca5c873fbefd25a136fbc5605553cc950028c462c3c7d5e"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.15.4/mcpproxy-0.15.4-darwin-amd64.tar.gz"
      sha256 "a8aaa27815ee020d4fa952c3046849faac49343168e08c7f9fe7025bc6d66015"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.15.4/mcpproxy-0.15.4-linux-arm64.tar.gz"
      sha256 "6d38ac55d20afe7427f1184d5ccd2a1ca8b5ab5380cf805b04aee9b0f55f6922"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.15.4/mcpproxy-0.15.4-linux-amd64.tar.gz"
      sha256 "a9fbee3efc8cebbf63616fe12c8fcd2249cad0b72573efbe10ca16934196d008"
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
