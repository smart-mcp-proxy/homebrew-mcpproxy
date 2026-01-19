class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.15.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.15.2/mcpproxy-0.15.2-darwin-arm64.tar.gz"
      sha256 "c9df12fe460ca84121af73af5c79233431e94f86536211c5742b8e30759a08b0"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.15.2/mcpproxy-0.15.2-darwin-amd64.tar.gz"
      sha256 "78f1629ba831d2835faf3f0682c8b5f9953355c34adc5dd2478ef3dbb86e2524"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.15.2/mcpproxy-0.15.2-linux-arm64.tar.gz"
      sha256 "2c83b9c15b0356f34a6930596e4123edf579f49ff81d2a139aadfd6d4dd9efdb"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.15.2/mcpproxy-0.15.2-linux-amd64.tar.gz"
      sha256 "1782a556a2f8fd1d69f87a2e28c29b1636aebcfa4cd4639e6016dfa74a5fa535"
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
