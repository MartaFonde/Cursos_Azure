#Nivel de cuentas SAS, permisos completos
New-AzStorageAccountSASToken -Service Blob,File,Table,Queue -ResourceType Service,Container,Object -Permission "racwdlup"

#Nivel Blob SAS, permisos completos
New-AzStorageBlobSASToken -Container "ContainerName" -Blob "BlobName" -Permission rwd

#Llave generada a nivel de blob
sp=r
&st=2021-05-18T19:16:16Z
&se=2021-05-19T03:16:16Z
&spr=https
&sv=2020-02-10
&sr=b	
&sig=DBljJNV4qlh7bYwsOVuF1jqhiCIeTOQhDwzVn6ELIOI%3D

#URI pública con el recurso: https://demostorageportalprueba.blob.core.windows.net/fotos/ejer6DI_3.png?sp=r&st=2021-05-18T19:16:16Z&se=2021-05-19T03:16:16Z&spr=https&sv=2020-02-10&sr=b&sig=DBljJNV4qlh7bYwsOVuF1jqhiCIeTOQhDwzVn6ELIOI%3D

#Token de SAS
?sv=2020-02-10
&ss=bf
&srt=sco
&sp=rwtfx
&se=2021-05-19T03:21:25Z
&st=2021-05-18T19:21:25Z
&spr=https
&sig=gm1hYk7fh2FpEWzNSixzSBMPRs%2F4%2BBwPFbNGynm6oKY%3D

#Cadena de conexión
#BlobEndpoint=https://demostorageportalprueba.blob.core.windows.net/;QueueEndpoint=https://demostorageportalprueba.queue.core.windows.net/;FileEndpoint=https://demostorageportalprueba.file.core.windows.net/;TableEndpoint=https://demostorageportalprueba.table.core.windows.net/;SharedAccessSignature=sv=2020-02-10&ss=bf&srt=sco&sp=rwtfx&se=2021-05-19T03:21:25Z&st=2021-05-18T19:21:25Z&spr=https&sig=gm1hYk7fh2FpEWzNSixzSBMPRs%2F4%2BBwPFbNGynm6oKY%3D
