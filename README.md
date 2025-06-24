# Homebrew Tap for mcpproxy

This repository contains the Homebrew formula for [mcpproxy](https://github.com/smart-mcp-proxy/mcpproxy-go), a Smart MCP Proxy for intelligent tool discovery and proxying for Model Context Protocol servers.

## Installation

### Quick Install

```bash
brew install smart-mcp-proxy/mcpproxy/mcpproxy
```

### Manual Tap and Install

```bash
# Add the tap
brew tap smart-mcp-proxy/mcpproxy

# Install mcpproxy
brew install mcpproxy
```

## Usage

After installation, you can use mcpproxy directly:

```bash
# Show version
mcpproxy --version

# Show help
mcpproxy --help

# Run with default settings
mcpproxy

# Run with custom config
mcpproxy --config /path/to/config.yaml

# Run with custom data directory
mcpproxy --data-dir /path/to/data

# Enable tray mode (default)
mcpproxy --tray

# Disable tray mode
mcpproxy --tray=false
```

## ⚠️ IMPORTANT: Auto-Update Compatibility

**If you installed mcpproxy via Homebrew, you MUST disable the built-in auto-update feature** to avoid conflicts with Homebrew's package management.

mcpproxy includes a built-in auto-updater that can replace the binary, which conflicts with Homebrew's expectations. When installed via Homebrew:

1. **The built-in updater will be automatically disabled** (planned feature)
2. **Use Homebrew for updates instead**:
   ```bash
   brew update
   brew upgrade mcpproxy
   ```
3. **If auto-update happens accidentally**, reinstall via Homebrew:
   ```bash
   brew reinstall mcpproxy
   ```

### Current Auto-Update Behavior

mcpproxy currently includes these auto-update features:
- **Daily checks** for new releases from GitHub
- **"Check for Updates..."** option in system tray menu
- **Automatic binary replacement** when updates are found

These features work well for direct installations but can cause issues with package manager installations.

## Auto-Start on macOS

### Option 1: Using launchctl (Recommended)

Create a LaunchAgent to start mcpproxy automatically on login:

```bash
# Option A: Download the plist file from this repository
curl -o ~/Library/LaunchAgents/com.smartmcpproxy.mcpproxy.plist \
     https://raw.githubusercontent.com/smart-mcp-proxy/homebrew-mcpproxy/main/com.smartmcpproxy.mcpproxy.plist

# Option B: Create the plist file manually
cat > ~/Library/LaunchAgents/com.smartmcpproxy.mcpproxy.plist << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.smartmcpproxy.mcpproxy</string>
    <key>Program</key>
    <string>/opt/homebrew/bin/mcpproxy</string>
    <key>ProgramArguments</key>
    <array>
        <string>/opt/homebrew/bin/mcpproxy</string>
        <string>--tray=true</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>KeepAlive</key>
    <true/>
    <key>ProcessType</key>
    <string>Interactive</string>
    <key>StandardOutPath</key>
    <string>/tmp/mcpproxy.out</string>
    <key>StandardErrorPath</key>
    <string>/tmp/mcpproxy.err</string>
</dict>
</plist>
EOF

# Load the LaunchAgent
launchctl load ~/Library/LaunchAgents/com.smartmcpproxy.mcpproxy.plist

# Start immediately
launchctl start com.smartmcpproxy.mcpproxy
```

**Note**: If you have mcpproxy installed in a different location (e.g., Intel Mac uses `/usr/local/bin/mcpproxy`), update the path in the plist file accordingly.

### Option 2: macOS Login Items

1. Open **System Settings** → **General** → **Login Items**
2. Click the **+** button under "Open at Login"
3. Navigate to `/opt/homebrew/bin/mcpproxy` and add it
4. Optionally check "Hide" to start minimized to tray

### Removing Auto-Start

#### Remove LaunchAgent:
```bash
# Stop the service
launchctl stop com.smartmcpproxy.mcpproxy

# Unload the LaunchAgent
launchctl unload ~/Library/LaunchAgents/com.smartmcpproxy.mcpproxy.plist

# Remove the plist file
rm ~/Library/LaunchAgents/com.smartmcpproxy.mcpproxy.plist
```

#### Remove from Login Items:
1. Open **System Settings** → **General** → **Login Items**
2. Find mcpproxy in the list and click the **-** button

### Troubleshooting Auto-Start

#### Check LaunchAgent Status:
```bash
# List all LaunchAgents (look for mcpproxy)
launchctl list | grep mcpproxy

# Check logs
tail -f /tmp/mcpproxy.out /tmp/mcpproxy.err
```

#### Common Issues:
- **Path not found**: Update the path in the plist if mcpproxy is installed elsewhere
- **Permission denied**: Ensure the binary is executable: `chmod +x /opt/homebrew/bin/mcpproxy`
- **Tray not showing**: The app needs to run in an interactive session with GUI access

## Updating

To update mcpproxy to the latest version:

```bash
brew update
brew upgrade mcpproxy
```

## Uninstalling

To remove mcpproxy:

```bash
brew uninstall mcpproxy
```

To remove the tap:

```bash
brew untap smart-mcp-proxy/mcpproxy
```

## Development

This formula is maintained as part of the mcpproxy project. For issues related to the Homebrew formula, please open an issue in the [main mcpproxy repository](https://github.com/smart-mcp-proxy/mcpproxy-go/issues).

### Updating the Formula

When new versions of mcpproxy are released, this formula needs to be updated:

1. **Get the new SHA256**:
   ```bash
   curl -sL "https://github.com/smart-mcp-proxy/mcpproxy-go/archive/refs/tags/vX.X.X.tar.gz" | shasum -a 256
   ```

2. **Update Formula/mcpproxy.rb**:
   - Change the `url` to point to the new version tag
   - Replace the `sha256` with the new hash

3. **Test the update**:
   ```bash
   brew install --build-from-source ./Formula/mcpproxy.rb
   brew test mcpproxy
   ```

4. **Commit and push**:
   ```bash
   git add Formula/mcpproxy.rb
   git commit -m "Update mcpproxy to vX.X.X"
   git push origin main
   ```

### Recommendations for mcpproxy Development

To improve Homebrew compatibility, consider these enhancements to mcpproxy:

1. **Add environment variable detection**:
   ```go
   // Disable auto-update when installed via package manager
   if os.Getenv("HOMEBREW_PREFIX") != "" {
       // Disable built-in updater
       autoUpdateEnabled = false
   }
   ```

2. **Add --disable-auto-update flag**:
   ```bash
   mcpproxy --disable-auto-update --tray=true
   ```

3. **Detection via binary path**:
   ```go
   // Check if running from Homebrew installation
   execPath, _ := os.Executable()
   if strings.Contains(execPath, "/homebrew/") || strings.Contains(execPath, "/usr/local/") {
       // Likely installed via Homebrew
       autoUpdateEnabled = false
   }
   ```

## License

This Homebrew formula is licensed under the same license as mcpproxy. 