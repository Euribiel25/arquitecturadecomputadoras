# Guarda la política actual de ejecución de scripts del usuario actual.
# Esto permite restaurarla al finalizar la práctica.
$SaveExecutionPolicy = Get-ExecutionPolicy

# Cambia la política de ejecución SOLO para el usuario actual.
# RemoteSigned permite ejecutar scripts locales y módulos descargados firmados.
# No modifica la política global del equipo.
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

# Instala el módulo oficial SpeculationControl desde PowerShell Gallery.
# Se instala solo para el usuario actual, no para todo el sistema.
Install-Module SpeculationControl -Scope CurrentUser

# Carga el módulo SpeculationControl en la sesión actual de PowerShell.
# Este módulo permite consultar mitigaciones contra vulnerabilidades de ejecución especulativa.
Import-Module SpeculationControl

# Ejecuta el diagnóstico.
# Este comando NO explota vulnerabilidades ni modifica el procesador.
# Solo consulta el estado de mitigaciones como Spectre, Meltdown, L1TF, MDS, entre otras.
Get-SpeculationControlSettings

# Restaura la política de ejecución que tenía el usuario antes de iniciar el laboratorio.
# Es una buena práctica para dejar el sistema como estaba.
Set-ExecutionPolicy $SaveExecutionPolicy -Scope CurrentUser