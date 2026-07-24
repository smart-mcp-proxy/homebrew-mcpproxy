class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for MCP servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  version "0.52.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.52.0/mcpproxy-0.52.0-darwin-arm64.tar.gz"
      sha256 "594296be582b102e268c92e0a40b5b5012d9f2b9cbdd6abb7e01e79ee69f461a"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.52.0/mcpproxy-0.52.0-darwin-amd64.tar.gz"
      sha256 "cfee1b37c223fa221f8e0b98eaa47f562a42ce605e5bd48a129bc00c07e50989"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.52.0/mcpproxy-0.52.0-linux-arm64.tar.gz"
      sha256 "d592de4f1c99f5594958d0b6f026e9430bfd820f9021d7f8005f1d8482e47cf5"
    else
      url "https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v0.52.0/mcpproxy-0.52.0-linux-amd64.tar.gz"
      sha256 "967703ea6b698f83e1988f06d7e1b0dbf89232c8dffeb7f2eef928954b22f126"
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
