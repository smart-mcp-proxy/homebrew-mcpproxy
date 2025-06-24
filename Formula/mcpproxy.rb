class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for Model Context Protocol servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  url "https://github.com/smart-mcp-proxy/mcpproxy-go/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "e9bfd6d955213c0ca17536c8a493dfa8d614c0497fd42da0281f41238adc13ef"
  license "MIT"
  head "https://github.com/smart-mcp-proxy/mcpproxy-go.git"

  depends_on "go" => :build

  def install
    # Set version and build info
    version = self.version
    commit = `git rev-parse --short HEAD 2>/dev/null || echo "unknown"`.strip
    date = Time.now.utc.strftime("%Y-%m-%dT%H:%M:%SZ")
    
    # Build binary with version injection (matching your build.sh)
    system "go", "build", 
           "-ldflags", "-X main.version=v#{version} -X main.commit=#{commit} -X main.date=#{date} -s -w",
           "-o", "mcpproxy", 
           "./cmd/mcpproxy"
    
    bin.install "mcpproxy"
  end

  test do
    # Test version output
    assert_match "v#{version}", shell_output("#{bin}/mcpproxy --version")
    
    # Test help output 
    help_output = shell_output("#{bin}/mcpproxy --help")
    assert_match "Smart MCP Proxy", help_output
    assert_match "Intelligent tool discovery", help_output
  end
end 