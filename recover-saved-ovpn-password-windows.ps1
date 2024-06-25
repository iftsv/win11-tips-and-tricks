# this script helps to recover saved OpenVPN passwords from Windows Registry

$keys = Get-ChildItem "HKCU:\Software\OpenVPN-GUI\configs"
$items = $keys | ForEach-Object {Get-ItemProperty $_.PsPath}

foreach ($item in $items)
{
	$encryptedbytes=$item.'key-data'
	$entropy=$item.'entropy'
	$entropy=$entropy[0..(($entropy.Length)-2)]
	
	if ($encryptedbytes) {
		$decryptedbytes = [System.Security.Cryptography.ProtectedData]::Unprotect(
			$encryptedBytes, 
			$entropy, 
			[System.Security.Cryptography.DataProtectionScope]::CurrentUser
		)
 
		Write-Host ($item.'PSChildName' + " -- " + [System.Text.Encoding]::Unicode.GetString($decryptedbytes))
	}
}
