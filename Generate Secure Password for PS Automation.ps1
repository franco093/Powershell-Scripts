﻿##### Generate AES Key ##### 
$KeyFile = "AES.key"
$Key = New-Object Byte[] 32   # You can use 16, 24, or 32 for AES
[Security.Cryptography.RNGCryptoServiceProvider]::Create().GetBytes($Key)
$Key | out-file $KeyFile

##### Generate Encrpyed Password via AES Key #### 
(get-credential).Password | ConvertFrom-SecureString -key (get-content aes.key) | set-content "password.txt"