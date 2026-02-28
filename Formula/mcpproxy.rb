class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.17.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.17.8/mcpproxy-0.17.8-darwin-arm64.tar.gz"
      sha256 "610e87aeb3af89726451dae11fa79fa3e9b39401073fef26abf11f09a369aee6"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.17.8/mcpproxy-0.17.8-darwin-amd64.tar.gz"
      sha256 "4230133f641d913f627f867185fa9686a7c8d1b1fe8dea52e799ae5056b26a3f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.17.8/mcpproxy-0.17.8-linux-arm64.tar.gz"
      sha256 "9aa18105dd68d2de35ea83a8a00cff7994e89a8311dfd8aec7228c64783a4972"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.17.8/mcpproxy-0.17.8-linux-amd64.tar.gz"
      sha256 "79d40587e6644819eefe3f114d83e90007b973be5409f897239e851af882b2c4"
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
