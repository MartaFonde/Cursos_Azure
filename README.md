## Cursos Azure ##
En Openwebinars    

[1. Curso de administración de Azure](https://openwebinars.net/academia/portada/administracion-azure/)  
[2. Curso de almacenamiento en Azure](https://openwebinars.net/academia/portada/almacenamiento-azure/)
[3. Curso de protección de datos en Azure](https://openwebinars.net/academia/portada/proteccion-datos-azure/)
[4. Curso de Redes Virtuales](https://openwebinars.net/academia/portada/redes-virtuales-azure/)

***
**14/05/2021**  
### Curso de Administración de Azure ###
- **Portal Azure y Cloud Shell**  
Portal Azure: Administración completa de los recursos y de todos los elementos que contienen estos recursos. Crear paneles personalizados de usuarios. Acceso a Cloud Shell. Recibir notificaciones.  
Aplicación móvil Azure: Gestión suscripciones, rescursos, consola Cloud Shell, notificaciones...  
Demostración - Funcionamiento del Portal Azure: Ayuda (documentación) y atajos de teclado, personalización  
**Cloud Shell**: Bash o PowerShell. Temporal (por sesión, por usuario). Hosteada por máquina virtual administrada por el Portal. Requiere un grupo de recursos, una cuenta de almacenamiento y Azure File share. Permisos -> Bash.  

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

**CLI**: Gestionar recursos Azure **multiplataforma**   
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

[Documentación CLI](https://docs.microsoft.com/es-es/cli/azure/)

**15/05/2021**
- **Recursos de gestión (Azure Resource Manager, ARM)**
Gestión de recursos a nivel de solución. Grupo de recursos.A través de consola o portal.  
Plantillas (ARM) -> Modelo de estado. 
Etiquetado: consulta por características, departamento... consolidando solución completa que está en diferentes grupos de recursos.  
APIs integra soluciones que hablen directamente contra el gestor de la plataforma (en .NET, Python...) solución que gestiona directamente recursos de Azure, sin acceder a portal, herramientas PowerShell, CLI.  
**Terminología**: 
    - Recurso: instancia única de servicio de Azure 
    - Grupo de Recursos: agrupación lógica de recursos
    - Proveedor de Recursos: servicio que proporciona recursos que puede implementar y administrar a través de Resource Manager (Con suscripción)
    - Plantilla ARM: Archivo JSON que permite describir declarativamente un conj de recursos (solución completa)
    - Sintaxis Declarativa: es lo que utiliza una plantilla para indicar lo que pretende crear. Definición del objeto. p.ej. Nombre cuenta almacenamiento + tipo de replicación de la cuenta)
  
**Implementaciones**: 
Los recursos sólo pueden existir en grupos de recursos. Los grupos de recursos no se pueden renombrar. Pueden tener recursos de varios tipos diferentes (servicios), diferentes proveedores, y de diferentes regiones. Las implementaciones son incrementales. Podemos eliminar recursos dentro de un grupo de manera imperativa. Los recursos dentro del grupo deberían tener el mismo ciclo de vida, misma solución (al eliminar o crear, sobre todos). Cada recurso sólo puede estar en un único grupo. Los grupos se pueden usar también para establecer permisos, seguridad.
**Bloqueo de recursos a través de Resource Manager**
Medida preventiva para evitar modificación (sólo lectura) y eliminación de recursos (permite modificación). Asignable a suscripción, grupos, o recurso concreto (instancia).  
**Mover recursos dentro de ARM** entre grupos o suscripciones.
Desde portal o desde PowerShell o CLI. Bloquea grupo, capa de gestión, durante la operación. Sigue prestando servicio. Hay servicios que no se pueden mover ([Ver Documentación](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/move-support-resources))

**Eliminar recursos ARM**: 
Remove-AzResourceGroup -Name "ContosoRG01"  
Remove-AzResource -ResourceId <ResourceID>  

Práctica: Bloqueo Grupos de recursos

- **Plantilla ARM**
Fichero JSON que contiene la definición de una solución completa compuesta de recursos. Permite reducir errores al implementar recurso. No es imperativo (no necesitamos saber los comandos), las acciones las realiza la plataforma. Modularizar y enlazar plantillas.  

**Esquema**
 ~~~
{
    "$schema": "http://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",        --> ¡clave obligatoria! versión sistema de implementación (ARM)
    "contentVersion": "",
    "parameters":{ }, 
    "variables":{ }, 
    "functions":[ ], 
    "resources":[ ], 
    "outputs":{ }
}
~~~

Parámetros: valores configurables cuando se ejecuta la plantilla.
[Documentación parámetros](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-parameters?tabs=json)


Variables: valores usados a través de la plantilla
[Documentación variables](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-variables?tabs=json)

**Plantillas QuickStart** 
[Documentación ARM templates](https://azure.microsoft.com/es-es/resources/templates/)  

[Plantillas](https://github.com/Azure/azure-quickstart-templates/)

Ejemplo creación nuevo recurso usando PowerShell y plantillas de Resource Manager.

 ***
**17/05/2021**  
### Curso de almacenamiento en Azure ###
- **Almacenamiento de cuentas**
Azure Storage: Servicio que puede usar para almacenar archivos, mensajes, tablas y otros tipos de información.  
Tres categorías de almacenamiento de Azure:
  - Almacenamiento para máquinas virtuales: discos y recursos compartidos de archivos 
  - Datos no estructurados - Blobs y Data Lake Store
  - Datos estructurados: tablas, Cosmos DB y Azure SQL DB

SERVICIOS AZURE STORAGE  
Azure Blobs: un almacén de objetos masivamente escalable para texto y datos binarios  
Archivos de Azure: recursos compartidos de archivos administrados para implementaciones en la nube o locales  
Tablas de Azure: un almacén NoSQL para almacenamiento de datos estructurados sin esquemas  
Azure Queues: un almacén de mensajería para mensajería confiable entre componentes de la aplicación  

Práctica: creación de cuenta de almacenamiento desde portal, PowerShell y CLI  

**Azure Storage Explorer**  
Acceder a múltiples cuentas y suscripciones (de todo tipo). Crear, eliminar, ver, editar recursos de almacenamiento. Ver y editar Blob, Queue, Table, File, Cosmos DB Storage y Data Lake StoragE.  
Crear claves de firma de acceso compartido (SAS).  
Multiplataforma.  
Opciones de conexión: suscripción, almacenamiento de desarrollo local (emulador), adjuntando a almacenamiento externo, utilizando una firma de acceso compartido ó con una cuenta de Azure Cosmos DB mediante una cadena de conexión.  

Práctica:  
[Instalación Storage Explorer](https://azure.microsoft.com/es-es/features/storage-explorer/)  
Conexión a una suscripción de Azure  
Adjuntar una cuenta de almacenamiento de Azure

- **Almacenamiento Blob** 
Blob Storage: Almacena datos no estructurados en la nube. Puede almacenar cualquier tipo de texto o datos binarios. También se conoce como almacenamiento de objetos. URI propia.
Todos los blobs deben estar en un contenedor. Nº de containers y blobs ilimitado.  
Niveles de acceso: Private, Blob, Container

Blob Performance Tiers: Hot (diario), Cool (30 días), Archive (180 días) -> Coste

Uploading blobs. Tres formatos de envío (empaquetado):  
Bloquear blobs (predeterminado): útil para almacenar texto o archivos binarios  
Blobs de página: más eficientes para operaciones frecuentes de lectura/escritura. Discos MV   
Agregar blobs: útil para los escenarios de registro  
=> No puede cambiar un tipo de blob una vez que se ha creado  
 
Blob Access Policies: Proporciona un nivel adicional de control sobre SAS del lado del servidor. Agrupa SAS para proporcionar restricciones adicionales para firmas vinculadas a la política. Compatible con contenedores de blobs, archivos compartidos, tablas y colas

 Blob Storage Pricing -> Costos cuentas de almacenamientos: servicio (blobs ó files), acceso a datos, transacción, transferencia de datos de Geo-Replicación, transferencia de datos de salientes (desde fuera de Azure), cambiar de nivel de almacenamiento

 Práctica:  
 Creación contenedor  
 Subir un blob de bloques  
 Descargar un blob de bloques  
 Explore con Storage Explorer

- **Azure Files**  
Archivos compartidos gestionados en la nube a los que se puede acceder a través de SMB   
[Azure Files vs Azure Blobs](https://github.com/MartaFonde/Cursos_Azure/blob/master/AlmacenamientoAzure/AzureFiles/4.2_Archivos_vs_Blobs.pdf)  
Azure Files -> uds montadas de disco que se puede compartir entre varias cargas de trabajo (MV).  
Azure Blobs -> sistema de compartición a gran escala de ficheros divididos en bloques, en containers.   

**Crear unidades de disco compartido** en portal y PowerShell

Asignación de archivos compartidos en Windows (Mapear uds de Azure Files en Windows)  
Asignación de archivos compartidos en Linux  

**Habilitar el uso de protocolo seguro https** en nuestra cuenta de almacenamiento.  
A diferencia de Azure Blobs, en Files siempre será requisito.  
Configuración de la cuenta de almacenamiento (no desde Files).

**Crear instantáneas de archivos compartidos** <- recuperar ficheros. 

Práctica:  
Crear recurso compartido de archivos y subir un archivo  
Administrar instantáneas.  
Crear un recurso compartido de archivos (PowerShell).  
Montar un recurso compartido de archivos (PowerShell).  

**18/05/2021**
- **Seguridad de almacenamiento**
Storage Service Encryption (SSE): encripta automáticamente todos los ficheros que almacenamos en azure.  
Autenticación con Azure AD (roles) y RBAC  
Encriptado Azure disk  
Claves compartidas  
Client-side encriptado, HTTPS y SMB3.0 para datos de tránsito  
Acceso anónimo a blobs y containers  
Shared Access Signatures (SAS) -> Sistema de acceso compartido. Permisos de acceso a los
usuarios, niveles. Por directivas, no por URI  
!!! Llave SAS vinculada a key primaria/secundaria. Si rebocamos una key todas las llaves SAS que dependan de ella se van a rebocar, las tendríamos que volver a generar.  
Un SAS es un URI que apunta a a uno o más recursos de almacenamiento.  
URI+SASToken (?sv=...)  -> Parámetros SAS  

Práctica: SAS Portal. Crear un SAS a nivel servicio y a nivel cuenta.  

Customer Managed Keys -> Azure Key Vault, desde API, PowerShell ó CLI  

Práctica: SAS Storage Explorer  
Generar una cadena de conexión SAS para la cuenta que se desea compartir.    
Adjuntar a una cuenta de almacenamiento mediante  una cadena de conexión SAS  

**19/05/2021**
### Curso de Protección de datos en Azure ###
- **Replicación de datos**: Necesariamente. 3 copias del dato -> estrategias de replicación:  
Redundancia local: Mantiene 3 copias de datos en una sola instalación.  
Redundancia de zonas: replica sus datos en tres clusters de almacenamiento en una sola región. Cada clúster está físicamente separado, propia zona de disponibilidad, autónoma.  
Redundancia geográfica: mín 6 copias del dato. Vínculada región primaria-secundaria. 
Redundancia geográfica con acceso a lectura  

**20/05/2021**  
**Copias de seguridad**
Servicio BackUp  
Opciones del almacén de copias de seguridad -> Workload running: Azure / On-Premise / Local

Práctica: Copias de seguridad de archivos compartidos  
Crear un almacén de (copias) seguridad  
Configurar el almacén  
Explorar la información de monotorización  

Implementar copias de seguridad locales de archivos y carpetas -> Agente MARS servicio  
No puedo descargar el programa por falta de espacio en el disco)  
[install Agente MARS](https://docs.microsoft.com/en-us/azure/backup/install-mars-agent)  

- **Copias de seguridad en MV**  
  - Azure Site Recovery (ASR): replica MV de Azure de una región de Azure a otra. MVware locakes, HyperV-, servidores físicos (Windows y Linux), MV de Azure Stack a Azure.  
Desde servidores físicos en un sitio secundario. Se reduce coste infraestrutura. Migraciones.  
  - AzureBackup Server.
  - Snapshots

Arquitectura de Azure a Azure , recuperación de datos en MV con ASR. Cambio dirección flujo datos.  
On-premise  

**Servidor de respaldo de Azure**: DPM/MABS y ek agente MARS para gestión y monitorización políticas. Flexibilidad y opciones de prog granular.  

***

**22/05/2021**  
### Curso de Redes Virtuales ###  
- **Redes Virtuales**
  Componentes de red: Servicios capa Networking -> Balanceador de cargas, DNS, Application Gateway, VPN Gateway, ExpressRoute, Content Delivery Network, Traffic Manager, Network Watcher  

**23/05/2021**  
Red Virtual -> Subredes -> Interfaces de las MV (tienen que tener al menos 1 NIC). Red virtual limitada a una región. Posible conexión interregional. Conexiones VPN entre redes virtuales on-premises, privadas... nube híbrida.  

**Subredes** segmentos virtuales que dividen los espacios de direcciones de una red virtual. Comunicación entre si, y de incorporarle gateways con IP públicas que podrán lanzar VNP y conectarse también a redes que tengamos on-premises y en otras redes/subredes virtuales que estean en Azure.  
 
Práctica: Creación de red virtual desde Portal y desde Powershell y CLI  

NIC múltiples en MV: IP+MAC asociado a cada interfaz de red. Múltiples NIC para gestión de tráfico de red, aislamiento del tráfico y para dispositivos virtuales. Tamaño VM -> cant de NIC admisibles.   
Conexión entre MV entre subredes de la misma red virtual (no entre redes virtuales)  

Práctica: Creación VM con varias NICs con CLI

- **IP Addressing**
IP Pública y privada (dentro de la red virtual). IP estáticas o dinámicas.  

Práctica: Administración de IP Addresses con PowerShell.  
Recuperar información de dirección IP privada estática.  
Pasar IP de estática a dinámica.  
ELiminar una dirección IP privada estática.  
