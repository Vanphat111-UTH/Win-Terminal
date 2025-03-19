[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$esc = [char]27

#=========Function=========#
function ColorCheck {


	$colors = @("30", "31", "32", "33", "34", "35", "36", "37") # Black, Red, Green, Yellow, Blue, Magenta, Cyan, White

	Write-Host "`n# Color Check`n"
	for ($i = 0; $i -lt $colors.Length; $i++) {
		$color = $colors[$i]
		Write-Host "$esc[1;${color}m*** AaBbCs $esc[0m -- $esc[1;${color}m \\ || // $esc[0m ---> COLOR_0$($i+1)"
	}
}



#=========Main=========#
Write-Host "$esc[31mWelcome back, $esc[32mVanphat111.           $esc[1;36mHO VAN PHAT | BIDV | 6263866929"
Write-Host " "

$ProcessActive = Get-Process code -ErrorAction SilentlyContinue
if($ProcessActive -eq $null)
{
	winfetch
}
else
{
	ColorCheck
}


$Theme = 'atomicBit-remake'
oh-my-posh init pwsh --config "C:\Program Files (x86)\oh-my-posh\themes\$Theme.omp.json" | Invoke-Expression



#=========Module=========#
Import-Module -Name Terminal-Icons




#=========Alias=========#
Set-Alias -Name npp -Value 'D:\notepad++\notepad++.exe'
Set-Alias -Name SD -Value shutdown
Set-Alias -Name vscode -Value '~\AppData\Local\Programs\Microsoft VS Code\code.exe'
Function lsa { Get-ChildItem -Force }





#####
#if (Test-Path "C:\Users\phath\.jabba\jabba.ps1") { . "C:\Users\phath\.jabba\jabba.ps1" }






