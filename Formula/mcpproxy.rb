class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.69.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.69.0/mcpproxy-0.69.0-darwin-arm64.tar.gz"
      sha256 "dc738826b3252754101c699ba544fb0cf418c3a8a2cac9b1631408c1f3e42f04"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.69.0/mcpproxy-0.69.0-darwin-amd64.tar.gz"
      sha256 "c21e1bd56606867478489817b4b05653a802660a2038860b41211de18dfb6fd7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.69.0/mcpproxy-0.69.0-linux-arm64.tar.gz"
      sha256 "d290099dbd04c4ff52e15d528227c9ea6d43dc7cb46d7c1fc04f5f74630d62bd"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.69.0/mcpproxy-0.69.0-linux-amd64.tar.gz"
      sha256 "890324f93262d7b551488b102689f4aa1cd6ebe22960f467a0395362d18e629e"
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
