@echo off
setlocal
rem ============================================================
rem  SnapSet by Technified World
rem  Version : v1.0.0-beta
rem  Purpose : Single command launcher for Windows 11 network
rem            and system settings pages
rem  Usage   : snapset <command>
rem            Run snapset with no arguments to display help
rem  Repo    : https://github.com/TechnifiedWorld/snapset
rem ============================================================

rem %~1  — expands the first argument, stripping surrounding quotes if present
rem  x   — short variable used for all command matching below
set "x=%~1"

rem ------------------------------------------------------------
rem  CORE NETWORK SETTINGS
rem  Opens ms-settings: URIs for the main network pages
rem ------------------------------------------------------------

rem Network & Internet — main landing page for all network settings
if /i "%x%"=="n"         start "" ms-settings:network-status           & exit /b
if /i "%x%"=="network"   start "" ms-settings:network-status           & exit /b

rem Mobile Hotspot — toggle and configure the Windows hotspot
if /i "%x%"=="h"         start "" ms-settings:network-mobilehotspot    & exit /b
if /i "%x%"=="hotspot"   start "" ms-settings:network-mobilehotspot    & exit /b

rem Wi-Fi — manage wireless networks and adapter settings
if /i "%x%"=="wi"        start "" ms-settings:network-wifi             & exit /b
if /i "%x%"=="wifi"      start "" ms-settings:network-wifi             & exit /b

rem VPN — add or manage VPN connections
if /i "%x%"=="vp"        start "" ms-settings:network-vpn              & exit /b
if /i "%x%"=="vpn"       start "" ms-settings:network-vpn              & exit /b

rem Proxy — configure manual or automatic proxy settings
if /i "%x%"=="px"        start "" ms-settings:network-proxy            & exit /b
if /i "%x%"=="proxy"     start "" ms-settings:network-proxy            & exit /b

rem ------------------------------------------------------------
rem  ADVANCED AND DIAGNOSTICS
rem ------------------------------------------------------------

rem Advanced network settings — hardware properties, more adapters
if /i "%x%"=="av"        start "" ms-settings:network-advancedsettings  & exit /b
if /i "%x%"=="advanced"  start "" ms-settings:network-advancedsettings  & exit /b

rem Ethernet — wired adapter settings (requires active wired adapter)
if /i "%x%"=="et"        start "" ms-settings:network-ethernet          & exit /b
if /i "%x%"=="ethernet"  start "" ms-settings:network-ethernet          & exit /b

rem Data usage — ms-settings:datausage is broken on Windows 11 25H2
rem              routes to Advanced network settings where Data usage tab lives
if /i "%x%"=="du"        start "" ms-settings:network-advancedsettings  & exit /b
if /i "%x%"=="datausage" start "" ms-settings:network-advancedsettings  & exit /b

rem ------------------------------------------------------------
rem  ADAPTER PANEL (ncpa.cpl)
rem  Use for: DNS config, Wi-Fi properties, protocol bindings
rem  DNS tip: right-click adapter > Properties > IPv4 > DNS fields
rem ------------------------------------------------------------

if /i "%x%"=="ad"        start "" ncpa.cpl                             & exit /b
if /i "%x%"=="adapters"  start "" ncpa.cpl                             & exit /b
if /i "%x%"=="wp"        start "" ncpa.cpl                             & exit /b
if /i "%x%"=="wifiprop"  start "" ncpa.cpl                             & exit /b

rem ------------------------------------------------------------
rem  SYSTEM SETTINGS
rem ------------------------------------------------------------

rem Environment Variables — opens dialog directly, skips System Properties
rem Uses rundll32 to call EditEnvironmentVariables from sysdm.cpl
if /i "%x%"=="ev"        start "" rundll32.exe sysdm.cpl,EditEnvironmentVariables & exit /b
if /i "%x%"=="envars"    start "" rundll32.exe sysdm.cpl,EditEnvironmentVariables & exit /b

rem ------------------------------------------------------------
rem UNRECOGNISED COMMAND — argument provided but no match found
rem ------------------------------------------------------------
if not "%x%"=="" (
    echo.
    echo Error: "%x%" is not a recognised snapset command.
    echo Run snapset with no arguments to see the full command list.
    echo.
    pause
    exit /b 1
)

rem ------------------------------------------------------------
rem HELP — displayed when no argument is provided
rem pause keeps the window open when script is double-clicked
rem ------------------------------------------------------------
echo.
echo snapset v1.0.0-beta ^| Technified World
echo ============================================
echo Usage: snapset ^<command^>
echo.
echo Short    Long         Opens
echo -------  ----------   ----------------------------------------
echo n        network      Network ^& Internet
echo h        hotspot      Mobile Hotspot settings
echo wi       wifi         Wi-Fi settings
echo vp       vpn          VPN settings
echo px       proxy        Proxy settings
echo av       advanced     Advanced network settings
echo et       ethernet     Ethernet ^(requires active wired adapter^)
echo du       datausage    Data usage ^(via Advanced network settings^)
echo ad       adapters     Adapter panel ^(DNS / protocol config^)
echo wp       wifiprop     Wi-Fi adapter properties
echo ev       envars       Environment Variables ^(direct dialog^)
echo.
echo Tips:
echo - DNS config: snapset ad ^> right-click adapter ^> Properties ^> IPv4
echo - Wi-Fi advanced: snapset wp ^> right-click ^> Properties ^> Configure ^> Advanced
echo - Data usage: snapset du ^> click Data usage tab
echo.
pause
exit /b 0
