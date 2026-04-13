class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.24.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.24.3/mcpproxy-0.24.3-darwin-arm64.tar.gz"
      sha256 "9e081dc75b6024b5dd249571b36de7adafeebb2d56affb3ec5a5d5dc592aecb6"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.24.3/mcpproxy-0.24.3-darwin-amd64.tar.gz"
      sha256 "12615be33d6003185e67262706419b6d7c46546a6e420d56f39a9266b64fd359"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.24.3/mcpproxy-0.24.3-linux-arm64.tar.gz"
      sha256 "6908f2ca02f556b27c477a0b06b1b758f2cac75bd6825460e40f55145ef0e2e7"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.24.3/mcpproxy-0.24.3-linux-amd64.tar.gz"
      sha256 "9cd4b380190c508e42d446c0c37c7d7ca38b711b02319f62bbf78a46a12c19a3"
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
