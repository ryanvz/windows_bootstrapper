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

$env:Path = [System.Environment]::GetEnvironmentVariable("PATH", "Machine")

gem install -Y bundle rake

if(-not (test-path ~\.ssh\id_rsa))
{
	    if($cert = Read-Host 'Paste your id_rsa key' -AsSecureString) { echo $cert >> ~/.ssh/id_rsa }
}

git clone git@github.com:Jungledisk/myjungledisk.com.git
cd myjungledisk.com
git submodule init
git submodule update
rake
