class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.17.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.17.7/mcpproxy-0.17.7-darwin-arm64.tar.gz"
      sha256 "27c540a0f0f0da86da81560fcfec515f5a41128c111267c4ba0e59202ffc57fd"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.17.7/mcpproxy-0.17.7-darwin-amd64.tar.gz"
      sha256 "7567010cc374daf135b3f31f54ca64c02d4664633177ae6db2cb25921fccd7e0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.17.7/mcpproxy-0.17.7-linux-arm64.tar.gz"
      sha256 "ba17dd46c81106171010d5a2270b1895a83e5e4d56f38c2baf23a9137c53badd"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.17.7/mcpproxy-0.17.7-linux-amd64.tar.gz"
      sha256 "239562946390fe1edf0c8fb73bc46292f45e73500ba2b50077a984ab668a9b7b"
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
