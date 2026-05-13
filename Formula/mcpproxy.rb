class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.30.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.30.0/mcpproxy-0.30.0-darwin-arm64.tar.gz"
      sha256 "bf7b9b800afc09d17ce02989fbae49a799c30cb93f5b5204fa9d9200ecd2cde2"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.30.0/mcpproxy-0.30.0-darwin-amd64.tar.gz"
      sha256 "f8f0af60ffeba2aaa6dfe655e1a46d79eb1135b85f5d6e8d7ba9c00abbb549a2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.30.0/mcpproxy-0.30.0-linux-arm64.tar.gz"
      sha256 "d566e59a79576c2c0e317c8a80603dd0e456c64af0832241a94b55bd824c7648"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.30.0/mcpproxy-0.30.0-linux-amd64.tar.gz"
      sha256 "3189f8a24ac9758140736a7fbb7bb8f6b0e43ecc36c1a1e671309583828658d8"
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
