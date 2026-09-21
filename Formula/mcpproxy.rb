class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.68.0/mcpproxy-0.68.0-darwin-arm64.tar.gz"
      sha256 "3fe961c2f9197907f7fecde54de0545f3c4daeee76f68f9e5d32b787f4869c88"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.68.0/mcpproxy-0.68.0-darwin-amd64.tar.gz"
      sha256 "a7f8a0438ffbe3de9378a78d1c00966cfefc158217caa3d1adee16b665ea3654"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.68.0/mcpproxy-0.68.0-linux-arm64.tar.gz"
      sha256 "9dee796513bb907643307d91c4b8cd6b99cfbb182c29bf7c14dc6c9e376c51c5"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.68.0/mcpproxy-0.68.0-linux-amd64.tar.gz"
      sha256 "b403826b1b8deeaf6b7c48285ff38cfaee817dd805261a3e1a9c24b573d70d4e"
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
