class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.46.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.46.0/mcpproxy-0.46.0-darwin-arm64.tar.gz"
      sha256 "4f24f83dac2b87c33d5875da0ad3de7a2f66861b4a6f1153dd460926a5e84d74"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.46.0/mcpproxy-0.46.0-darwin-amd64.tar.gz"
      sha256 "0ddc313ab46b8e9912b267d4c468275025d0df1f033a5f00084e76ad4c344a80"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.46.0/mcpproxy-0.46.0-linux-arm64.tar.gz"
      sha256 "3bf74363028d4dd383020cc8159897ee8dd7492d2a35852ab3bdb29a632cc375"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.46.0/mcpproxy-0.46.0-linux-amd64.tar.gz"
      sha256 "9bf93eb36d99132a210df73fa07b836ff65eca2b69b2d375c4eea0040c8d4b2f"
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
