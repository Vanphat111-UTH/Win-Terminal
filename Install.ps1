#=====Function=====#
Function chocoCheck {
    try {
        choco *>$null
        $errorOccurred = $false
    } catch {
        $errorOccurred = $true
    }

    if ($errorOccurred) {
        Set-ExecutionPolicy AllSigned
        Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    } else {
        echo "Choco has installed."
    }
}

Function setUpOh-My-Posh {
    choco install oh-my-posh -y --ignore-checksums
    mkdir "C:\Program Files (x86)\oh-my-posh\themes" -ErrorAction SilentlyContinue
    cp ".\Config_File\atomicBit-remake.omp.json" "C:\Program Files (x86)\oh-my-posh\themes"
    mkdir "~\Documents\WindowsPowerShell" ~\Documents\WindowsPowerShell
    cp ".\Config_File\Microsoft.PowerShell_profile.ps1" "~\Documents\WindowsPowerShell"
    Write-Host "Setup Oh-My-Posh successfull." -ForegroundColor Green
}

Function installPSModule {

    Install-Module -Name Terminal-Icons -Repository PSGallery -Force
    Write-Host "Install PS module successfull." -ForegroundColor Green
}

Function installNerdFont {
    $fontUrl = "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaCode.zip"
    $fontPath = "$env:TEMP\CascadiaCode.zip"
    $extractPath = "$env:TEMP\CascadiaCode"

    Invoke-WebRequest -Uri $fontUrl -OutFile $fontPath
    Expand-Archive -Path $fontPath -DestinationPath $extractPath
    $fontFiles = Get-ChildItem -Path $extractPath -Filter "*.ttf"

    foreach ($file in $fontFiles) {
        $dest = "$env:WINDIR\Fonts\" + $file.Name
        Copy-Item -Path $file.FullName -Destination $dest
        New-ItemProperty -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Fonts" -Name $file.Name -Value $file.Name -PropertyType String -Force
    }

    Write-Host "Cascadia Code Nerd Font has installed!" -ForegroundColor Green
}

Function installWinfetch {
    choco install winfetch -y --ignore-checksums
    mkdir "~\.config\winfetch" -ErrorAction SilentlyContinue
    cp ".\Config_File\config.ps1" "~\.config\winfetch"
    Write-Host "Setup winfetch successfull." -ForegroundColor Green
}

#=====Main=====#

chocoCheck
setUpOh-my-posh
installNerdFont
installPSModule
installWinfetch


Write-Host "Restart powershell to see the changes." -ForegroundColor Green