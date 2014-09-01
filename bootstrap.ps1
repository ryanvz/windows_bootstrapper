Function Instal-Dependancy($name)
{
    Write-Output ("Installing " + $name)
    choco install $name
}

# Get Chocolatey
if(-Not (Test-Path env:ChocolateyInstall))
{
    echo "Installing Chocolatey"
    iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
}

$installed_deps = choco list -localonly | % { $_.split()[0] }
$required_deps = @("git", "DotNet4.5", "microsoft-build-tools", "msdeploy", "NuGet.CommandLine", "ruby")

$required_deps | ? { $installed_deps -notcontains $_ } | % { Instal-Dependancy $_ }
