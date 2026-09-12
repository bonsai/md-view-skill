param(
    [Parameter(Mandatory = $true)]
    [string]$Path,

    [switch]$Raw,
    [switch]$Tui
)

$ErrorActionPreference = 'Stop'
try { [Console]::OutputEncoding = [System.Text.Encoding]::UTF8 } catch {}

if (-not (Test-Path -LiteralPath $Path)) {
    Write-Error "Not found: $Path"
    exit 1
}
$target = (Resolve-Path -LiteralPath $Path).Path

$glow = Get-Command glow -ErrorAction SilentlyContinue
if ($glow) {
    if ($Tui) {
        & glow -t --style dark $target
    }
    else {
        & glow --style dark $target
    }
    exit
}

$wglow = & wsl -e sh -c "command -v glow" 2>$null
if ($wglow) {
    $unix = (& wsl -e wslpath -u $target).Trim()
    if ($Tui) {
        & wsl -e glow -t --style dark $unix
    }
    else {
        & wsl -e glow --style dark $unix
    }
    exit
}

Write-Output "[md-view] glow not found. plain fallback:"
Get-Content -LiteralPath $Path