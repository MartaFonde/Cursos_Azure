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
Los recursos sólo pueden existir en grupos de recursos. Los grupos de recursos no se pueden renombrar. Pueden tener recursos de varios tipos diferentes (servicios), diferentes proveedores, y de diferentes regiones. Las implementaciones son incrementales. Podemos eliminar recursos dentro de un grupo de manera imperativa. Los recursos dentro del grupo deberían tener el mismo ciclo de vida, misma solución. Al eliminar o crear, todos. Cada recurso sólo puede estar en un único grupo. Los grupos se pueden usar también para establecer permisos, seguridad.
**Bloqueo de recursos a través de Resource Manager**
Medida preventiva para evitar modificación (sólo lectura) y eliminación de recursos (permite modificación). Asignable a suscripción, grupos, o recurso concreto (instancia).  
**Mover recursos dentro de ARM** entre grupos o suscripciones.
Desde portal o desde PowerShell o CLI. Bloquea grupo, capa de gestión, durante la operación. Sigue prestando servicio. Hay servicios que no se pueden mover 
[Documentación](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/move-support-resources) 

**Eliminar recursos ARM**: 
Remove-AzResourceGroup -Name "ContosoRG01"  
Remove-AzResource -ResourceId <ResourceID>  

**Práctica: Bloqueo Grupos de recursos**

- **Plantilla ARM**
Fichero JSON que contiene la definición de una solución completa compuesta de recursos. Permite reducir errores al implementar recurso. No es imperativo (no necesitamos saber los comandos), las acciones las realiza la plataforma. Sólo las definimos. Podemos reutilizarlas. Modularizar y enlazarp plantillas. Simplica orquestación, podemos generar automatismos. 
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
Plantillas precreadas.
[Documentación ARM templates](https://azure.microsoft.com/es-es/resources/templates/)  

[Plantillas](https://github.com/Azure/azure-quickstart-templates/)

Ejemplo creación nuevo recurso usando PowerShell y plantillas de Resource Manager.
