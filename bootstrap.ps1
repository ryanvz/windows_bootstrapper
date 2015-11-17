# Get Chocolatey
if(-Not (Test-Path env:ChocolateyInstall))
{
    echo "Installing Chocolatey"
    iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
}

choco install git DotNet4.5 microsoft-build-tools windows-sdk-8.0 aspnetmvc4.install webdeploy NuGet.CommandLine ruby1.9 ruby.devkit notepadplusplus ConEmu GoogleChrome

#refresh path to pick up ruby binaries
$env:Path=[System.Environment]::GetEnvironmentVariable("PATH","Machine") + ";C:\Program Files (x86)\IIS\Microsoft Web Deploy V3;C:\Program Files (x86)\MSBuild\12.0\Bin"
[System.Environment]::SetEnvironmentVariable("PATH",$env:Path,"Machine")
gem install bundle
