class Mcpproxy < Formula
  desc "Smart MCP Proxy - Intelligent tool discovery and proxying for Model Context Protocol servers"
  homepage "https://github.com/smart-mcp-proxy/mcpproxy-go"
  url "https://github.com/smart-mcp-proxy/mcpproxy-go/archive/refs/tags/v0.3.3.tar.gz"
  sha256 "196b14b7e6a00f91ac7fecea1154716e9fa2ad347f82d36c04dbc18ea561a693"
  license "MIT"
  head "https://github.com/smart-mcp-proxy/mcpproxy-go.git"

  depends_on "go" => :build

  def install
    # Set version and build info
    version = self.version
    commit = `git rev-parse --short HEAD 2>/dev/null || echo "unknown"`.strip
    date = Time.now.utc.strftime("%Y-%m-%dT%H:%M:%SZ")
    
    # Set up Go module environment properly
    ENV["GO111MODULE"] = "on"
    ENV["GOPROXY"] = "direct"
    
    # Initialize go.mod if it doesn't exist or if there are module issues
    system "go", "mod", "tidy"
    
    # Build binary with version injection and proper module support
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