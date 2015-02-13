# Get Chocolatey
if(-Not (Test-Path env:ChocolateyInstall))
{
    echo "Installing Chocolatey"
    iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
}

choco install git DotNet4.5 microsoft-build-tools windows-sdk-8.0 aspnetmvc4.install webdeploy NuGet.CommandLine ruby1.9 ruby.devkit notepadplusplus ConEmu GoogleChrome

mkdir ~/.ssh
echo $null >> ~/.ssh/id_rsa
echo $null >> ~/.ssh/id_rsa.pub

#refresh path to pick up ruby binaries
$env:Path=[System.Environment]::GetEnvironmentVariable("PATH","Machine") + ";C:\Program Filesx86)\IIS\Microsoft Web Deploy V3"
[System.Environment]::SetEnvironmentVariable("PATH",$env:Path,"Machine")
gem install bundle
