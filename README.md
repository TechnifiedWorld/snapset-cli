# SnapSet

<p align="center">
  <img src="docs/logo.png" alt="SnapSet logo" width="220"/>
</p>

<p align="center">
![Platform](https://img.shields.io/badge/platform-Windows%2011-0078D4?style=flat-square&logo=windows11)
![Language](https://img.shields.io/badge/language-Batchfile-green?style=flat-square)
![License](https://img.shields.io/badge/license-MIT-blue?style=flat-square)
![Version](https://img.shields.io/github/v/release/TechnifiedWorld/snapset-cli?include_prereleases&label=version&style=flat-square&color=orange)
<p align="center">

> A lightweight Windows 11 command-line launcher for fast, direct access to network and system settings, without navigating through multiple screens.

A project by [Technified World](https://github.com/TechnifiedWorld).

---

## Why SnapSet?

Windows 11 buries frequently used network and system settings behind layers of clicks. Finding your VPN settings, resetting a network adapter, or checking data usage means navigating through Settings, clicking into the right category, and hunting for the right page, every time.

SnapSet eliminates that friction. One short command opens the exact settings page you need, instantly.

| Without SnapSet | With SnapSet |
|----------------|-------------|
| Start > Settings > Network & Internet > VPN | `snapset vp` |
| Start > Settings > Network & Internet > Mobile Hotspot | `snapset h` |
| Control Panel > Network Connections > Adapter Properties | `snapset ad` |
| System Properties > Environment Variables | `snapset ev` |
| Start > Settings > System > Display | `snapset ds` |
| Start > Settings > System > Power & sleep | `snapset pw` |
| Start > Settings > Windows Update | `snapset wu` |
| Start > Settings > System > Sound | `snapset sn` |
| Start > Settings > Windows Security | `snapset ws` |
| Start > Settings > Apps > Installed apps | `snapset ap` |

Works from a terminal, the Run dialog (`Win + R`), or a desktop shortcut. No installation required. A single `.bat` file is all it takes.

---

## Requirements

* Windows 11 (tested on build 26100, 25H2)
* No installation required. SnapSet is a single `.bat` file.
* No dependencies. No Python, Node.js, or package managers needed.
* Compatible with Command Prompt, PowerShell, and Windows Terminal
* Works from the Run dialog (`Win + R`) when placed in a PATH folder

---

## Setup

### Option 1 - Add to PATH (recommended)

1. Copy `scripts\snapset.bat` to a folder already in your PATH, e.g. `C:\wintools`
2. Open a new terminal and run `snapset` to verify

### Option 2 - Run from any terminal

1. Copy `scripts\snapset.bat` to your preferred location
2. Call it with its full or relative path, e.g.:
   `C:\wintools\snapset.bat hotspot`

### Option 3 - Desktop shortcut

1. Right-click the desktop > New > Shortcut
2. Set target to: `cmd /c snapset <command>`
3. Assign a keyboard shortcut in shortcut properties for one-key access

---

## Usage

```cmd
snapset <command>
```

Run `snapset` with no arguments to display the full command reference.

### Examples

Open Network & Internet settings:
```cmd
snapset n
snapset network
```

Open Mobile Hotspot settings:
```cmd
snapset h
snapset hotspot
```

Open the classic adapter panel for DNS configuration:
```cmd
snapset ad
snapset adapters
```

Open Environment Variables directly:
```cmd
snapset ev
snapset envars
```

> Both the short and long form of every command produce the same result.
> Short forms are optimised for speed, long forms for readability in scripts and shortcuts.

---

## Commands

### Network settings

| Short | Long | Opens |
|-------|------|-------|
| `n` | `network` | Network & Internet |
| `h` | `hotspot` | Mobile Hotspot settings |
| `wi` | `wifi` | Wi-Fi settings |
| `wm` | `wifiman` | Manage known Wi-Fi networks |
| `vp` | `vpn` | VPN settings |
| `px` | `proxy` | Proxy settings |
| `av` | `advanced` | Advanced network settings |
| `et` | `ethernet` | Ethernet (requires active wired adapter) |
| `du` | `datausage` | Data usage (via Advanced network settings) |

### Adapter panel

| Short | Long | Opens |
|-------|------|-------|
| `ad` | `adapters` | Classic adapter panel (DNS, protocol config) |

### System settings

| Short | Long | Opens |
|-------|------|-------|
| `ds` | `display` | Display settings (resolution, scale, refresh rate) |
| `pw` | `power` | Power and sleep settings |
| `sn` | `sound` | Sound settings (output, input, volume mixer) |
| `st` | `storage` | Storage and Storage Sense |
| `wu` | `update` | Windows Update |
| `bt` | `bluetooth` | Bluetooth devices |
| `sv` | `services` | Windows Services (elevation required for changes) |
| `ev` | `envars` | Environment Variables (direct dialog) |

### Security and privacy

| Short | Long | Opens |
|-------|------|-------|
| `ws` | `winsec` | Windows Security hub |
| `fw` | `firewall` | Defender Firewall with Advanced Security |

### Apps

| Short | Long | Opens |
|-------|------|-------|
| `ap` | `apps` | Apps and Features |

---

## Tips

**DNS configuration**
Windows 11 has no dedicated `ms-settings:` URI for DNS.
Use `snapset ad`, then right-click your adapter > Properties > Internet Protocol Version 4 (TCP/IPv4).

**Manage known Wi-Fi networks**
Use `snapset wm` to open the known networks page directly.
From here you can forget a network, change its priority, or inspect saved connections.

**Data usage**
`ms-settings:datausage` is non-functional on Windows 11 25H2.
Use `snapset du` to open Advanced network settings, then click the Data usage tab.

**Ethernet**
`snapset et` only opens successfully when an active wired adapter is detected.
Windows 11 silently redirects to Settings Home when no wired adapter is present.

**Windows Services**
Use `snapset sv` to open the Services panel.
Starting, stopping, or changing service startup type requires an elevated (Administrator) terminal or UAC prompt.

**Firewall**
Use `snapset fw` to open Windows Defender Firewall with Advanced Security.
This is the legacy MMC snap-in (`wf.msc`) — more powerful than the Settings page, with full inbound and outbound rule management. Elevation is required to create or modify rules.

---

## Known limitations

| Command | Limitation |
|---------|------------|
| `du` / `datausage` | No dedicated URI on 25H2. Opens Advanced network settings. |
| `et` / `ethernet` | Requires active wired adapter. |
| `sv` / `services` | Elevation required for start, stop, and configuration actions. |
| `ws` / `winsec` | Opens the standalone Windows Security app, not a Settings page. |
| `fw` / `firewall` | Uses `wf.msc` (legacy snap-in). Elevation required for rule changes. |

---

## Roadmap

| Status | Item |
|--------|------|
| `done` | Add display settings commands |
| `done` | Add power settings commands |
| `done` | Add Bluetooth settings commands |
| `done` | Add Windows Update command |
| `done` | Add Windows Services command |
| `done` | Add sound settings command |
| `done` | Add storage settings command |
| `done` | Add Windows Security command |
| `done` | Add Firewall command |
| `done` | Add Apps and Features command |
| `considering` | Explore hotspot on/off toggle via scripting |
| `considering` | PowerShell companion script |

---

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on reporting issues, suggesting features, and submitting changes.

---

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for a full history of changes.

---

## License

[MIT License](LICENSE) - (c) 2026 Technified World
