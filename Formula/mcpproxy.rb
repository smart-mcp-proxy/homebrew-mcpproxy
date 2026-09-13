class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.66.1/mcpproxy-0.66.1-darwin-arm64.tar.gz"
      sha256 "da7c1eaf0f67e995d76d26100f1170f31157f4542627eb734dceb84532220490"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.66.1/mcpproxy-0.66.1-darwin-amd64.tar.gz"
      sha256 "e609656261fb5d237be4d1e907217c9d4fbbfaffe1fa0921bfcb82a97f9264b4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.66.1/mcpproxy-0.66.1-linux-arm64.tar.gz"
      sha256 "483af026ad379fa3ca05681bb654b9eb1806b2be54d059f490af0ab73a28ee33"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.66.1/mcpproxy-0.66.1-linux-amd64.tar.gz"
      sha256 "5f34ce2ec4d9c6f7f470efb5aa36875f5721bd5b300bd74a57f259809428249c"
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
