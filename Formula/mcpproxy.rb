class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.49.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.49.0/mcpproxy-0.49.0-darwin-arm64.tar.gz"
      sha256 "54f5355f21d7e42cc03d84075351e4f9831f2a0812e37eaeca6e990e5a215346"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.49.0/mcpproxy-0.49.0-darwin-amd64.tar.gz"
      sha256 "76f7021ae2565ae33c25bad88f9a9ddaf81a2ff44ddf407bd3a8b6f0e7c08ed7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.49.0/mcpproxy-0.49.0-linux-arm64.tar.gz"
      sha256 "155f72b65a1bd1899858fcce0ed7f31d2ff0b65c94cacc07011f171c5579ce87"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.49.0/mcpproxy-0.49.0-linux-amd64.tar.gz"
      sha256 "f061efbeb369658953113e58ffe13fc35eadbef31de5531e128984e4685552b2"
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
