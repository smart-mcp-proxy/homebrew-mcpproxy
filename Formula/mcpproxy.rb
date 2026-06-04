class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.37.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.37.0/mcpproxy-0.37.0-darwin-arm64.tar.gz"
      sha256 "55f666bff1306b9bdc2ded352a05d156bc69146c34302f61b93f849135a42970"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.37.0/mcpproxy-0.37.0-darwin-amd64.tar.gz"
      sha256 "7997606fb99c512c76fa0cb89abf689bd0ca980a5d5989b05974720d3c936c75"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.37.0/mcpproxy-0.37.0-linux-arm64.tar.gz"
      sha256 "fb8bbf496cd6c5cfa2e4863fd2ea08fc805791b15950f96de3dbda1aa3c3cc85"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.37.0/mcpproxy-0.37.0-linux-amd64.tar.gz"
      sha256 "d6080cdb5c16a3caeba2a571a229ecc450f39c9ef1c7f9ff241581d987d10192"
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
