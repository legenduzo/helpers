# Last updated: 2 November 2025
param(
    [int]$Interval = 20
)

$Path = (Get-Location).Path
$Base = Split-Path -Leaf $Path
$RegistryPath = "$env:USERPROFILE\commands\autocommit_registry.json"

# Load registry
$Registry = @()
if (Test-Path $RegistryPath) {
    $Registry = Get-Content $RegistryPath | ConvertFrom-Json
}

# Check if folder is already in registry
$Existing = $Registry | Where-Object { $_.Folder -eq $Path }
if ($Existing) {
    $Existing.IntervalMinutes = $Interval
    Write-Host "Updated autocommit interval for $Base to $Interval minutes."
} else {
    $Registry += [PSCustomObject]@{
        Folder = $Path
        IntervalMinutes = $Interval
        LastRun = (Get-Date).AddMinutes(-$Interval)  # ensures immediate first run
    }
    Write-Host "Autocommit enabled for $Base every $Interval minutes."
}

# Save registry
$Registry | ConvertTo-Json | Set-Content $RegistryPath
