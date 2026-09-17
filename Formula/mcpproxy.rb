class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.67.0/mcpproxy-0.67.0-darwin-arm64.tar.gz"
      sha256 "1423ebc167a9bf4deab4cce93ba1ab33013fac7930318dbb3667c3779268eddd"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.67.0/mcpproxy-0.67.0-darwin-amd64.tar.gz"
      sha256 "27f0cbe73c32ea295146c27488b9176dcdd9dea7231cf322e8ec37de892af5a8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.67.0/mcpproxy-0.67.0-linux-arm64.tar.gz"
      sha256 "577ada1e6370aaf4d443e0d62fba4d7424066fa6b9569770977ef4f1fe732474"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.67.0/mcpproxy-0.67.0-linux-amd64.tar.gz"
      sha256 "23058ee8c4fa9f6cce8243ace0e1574094059996145e6fd92fdb42568ce56e46"
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
