class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.17.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.17.2/mcpproxy-0.17.2-darwin-arm64.tar.gz"
      sha256 "8453d56a831eec15f018aad03f38df5af40ff29aec24ab742ad571e79e5e0b03"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.17.2/mcpproxy-0.17.2-darwin-amd64.tar.gz"
      sha256 "19950711780ca0c757f72f5fa26ce7dbdbb274432a5779653231bcd76af2cff7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.17.2/mcpproxy-0.17.2-linux-arm64.tar.gz"
      sha256 "828e293d00ddc5155c741df3e0d9189795dee95d99cf080e69d406ab118ff910"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.17.2/mcpproxy-0.17.2-linux-amd64.tar.gz"
      sha256 "e2b59c42f5ba19486e87968a0164ad1bf0b79fadabdd6b49f867824f6856ee21"
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
