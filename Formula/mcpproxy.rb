class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.48.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.48.1/mcpproxy-0.48.1-darwin-arm64.tar.gz"
      sha256 "93eba083312855fed06ae78b75247591a2a15d35111b77d292a80293f76c4291"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.48.1/mcpproxy-0.48.1-darwin-amd64.tar.gz"
      sha256 "6e4f4e01c6539600211e80bf17aa03f01e738b3750ea97070f7b239581b9baae"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.48.1/mcpproxy-0.48.1-linux-arm64.tar.gz"
      sha256 "ddd4349a5d56cc0a685ecf44630cb29bdbddf085d27358fc49e8eeaae73dfc85"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.48.1/mcpproxy-0.48.1-linux-amd64.tar.gz"
      sha256 "4e03f11e6dd3e9cbd91b26392072e566dd54573a5d1a7471da4499beafeaeb97"
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
