# Get Chocolatey
if(-Not (Test-Path env:ChocolateyInstall))
{
    echo "Installing Chocolatey"
    iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
}

choco install git DotNet4.5 microsoft-build-tools webdeploy NuGet.CommandLine ruby1.9 ruby.devkit notepadplusplus ConEmu GoogleChrome

mkdir ~/.ssh
echo $null >> ~/.ssh/id_rsa
echo $null >> ~/.ssh/id_rsa.pub

#refresh path to pick up ruby binaries
$env:Path = [System.Environment]::GetEnvironmentVariable("PATH", "Machine")
gem install bundle
