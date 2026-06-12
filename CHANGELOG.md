# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.2.0] - 2026-06-12

### Added
- `sn` / `sound` - Sound settings (`ms-settings:sound`)
- `st` / `storage` - Storage and Storage Sense (`ms-settings:storagesense`)
- `ws` / `winsec` - Windows Security hub (`ms-settings:windowsdefender`)
- `fw` / `firewall` - Firewall and network protection (`ms-settings:windowsdefender-firewallandnetworkprotection`)
- `ap` / `apps` - Apps and Features (`ms-settings:appsfeatures`)

## [1.1.0] - 2026-05-06

### Added
- `ds` / `display` - Display settings (`ms-settings:display`)
- `pw` / `power` - Power and sleep settings (`ms-settings:powersleep`)
- `wu` / `update` - Windows Update (`ms-settings:windowsupdate`)
- `bt` / `bluetooth` - Bluetooth devices (`ms-settings:bluetooth`)
- `sv` / `services` - Windows Services (`services.msc`)

## [1.0.0] - 2026-05-06

### Changed
- Replaced `wp/wifiprop` (duplicate of `ad/adapters`) with `wm/wifiman`, which opens Manage known Wi-Fi networks via `ms-settings:network-wifisettings`

## [1.0.0-beta] - 2026-05-05

Initial release.

### Added
- `snapset.bat`: single unified launcher for Windows 11 network and system settings
- Short and long command aliases for all supported pages
- Built-in help output with usage tips
- Commands: `n/network`, `h/hotspot`, `wi/wifi`, `vp/vpn`, `px/proxy`,
  `av/advanced`, `et/ethernet`, `du/datausage`, `ad/adapters`,
  `wp/wifiprop`, `ev/envars`
- Project logo (`docs/logo.png`)
- Social preview image (`docs/social_preview.png`)

[Unreleased]: https://github.com/TechnifiedWorld/snapset/compare/v1.2.0...HEAD
[1.2.0]: https://github.com/TechnifiedWorld/snapset/compare/v1.1.0...v1.2.0
[1.1.0]: https://github.com/TechnifiedWorld/snapset/compare/v1.0.0...v1.1.0
[1.0.0]: https://github.com/TechnifiedWorld/snapset/compare/v1.0.0-beta...v1.0.0
[1.0.0-beta]: https://github.com/TechnifiedWorld/snapset/releases/tag/v1.0.0-beta
