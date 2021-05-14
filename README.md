## Cursos_Azure ##

En Openwebinars  

**14/05/2021**  
### Curso de Administración de Azure ###
- **Portal Azure y Cloud Shell**  
Portal Azure: Administración completa de los recursos y de todos los elementos que contienen estos recursos. Crear paneles personalizados de usuarios. Acceso a Cloud Shell. Recibir notificaciones.  
Aplicación móvil Azure: Gestión suscripciones, rescursos, consola Cloud Shell, notificaciones.  
Demostración - Funcionamiento del Portal Azure: Ayuda (documentación) y atajos de teclado, personalización  
**Cloud Shell**: Bash o PowerShell. Temporal (por sesión, por usuario). Hosteada por máquina virtual administrada por el Portal. Requiere un grupo de recursos, una cuenta de almacenamiento y Azure File share. Permisos -> Bash. Tiempo de espera 20'   

Acceso con prueba gratuita.  


- **Azure PowerShell y CLI**
PowerShell Cmdlets y Modules  
Cmdlets: verbo(acción)-nombre(sobre qué vamos a trabajar), enviada en módulos.
Módulos: DLL con el código para procesar cada cmdlet   
Podemos crear/obtener librerías/módulos de terceros.  

Módulo Azure PowerShell: contiene librerías (cmdlets) para gestionar recursos que están en Azure (registrar cuenta de almacenamiento, gestionar MV, containers, ...)  
 [Module Az cmdlets](https://github.com/Azure/azure-powershell) 
 Module Az -> verbo-Az
Práctica en Local  
Cmdlets válidos en PowerShell Code y Windows PowerShell con paquete de módulos.  

**CLI**: Gestionar recursos Azure **multiplataforma** (= scripts)  
Motor de ejecución Python  
Comandos estructurados en grupos y subgrupos  
find para localizar comandos  
--help para info

az vm restart -g MyResourceGroup -n MyVm  
(grupo) az --> (subgrupo) vm 
az vm --help  

Práctica:
[Instalación](https://docs.microsoft.com/es-es/cli/azure/install-azure-cli)
Login con Azure
Crear resource group 

Nos devuelve los resultados en formato JSON -> query  

[Documentación CLI](
https://docs.microsoft.com/es-es/cli/azure/)