class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.27.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.27.0/mcpproxy-0.27.0-darwin-arm64.tar.gz"
      sha256 "df4652b8b69eef95f64fe340fa0fa326a9d41b79ebe3e7c06aa4d90aa5f69661"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.27.0/mcpproxy-0.27.0-darwin-amd64.tar.gz"
      sha256 "1fa82c41bffb256905d658514fcb64e7b27640bd813421dd90c4a0e189a6bc77"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.27.0/mcpproxy-0.27.0-linux-arm64.tar.gz"
      sha256 "ece6a5d591ccddf82c41ecd35693c354195f5a03882d53542605b66e6dfd25cd"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.27.0/mcpproxy-0.27.0-linux-amd64.tar.gz"
      sha256 "2a47a11201218331024e5923d50aec41f51c915ab80a6fc3c299d37ebe71e65d"
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
