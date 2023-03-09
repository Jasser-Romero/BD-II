-- Respaldo Full de Base de datos Universidad
backup database Universidad
to disk = 'D:\Base de Datos\Respaldos\Universidad.bak'
with
name = 'Respaldo Full 1',
description = 'Copia completa de archivos de BD'

-- Respaldo diferencial de Base de datos
backup database Universidad
to disk = 'D:\Base de Datos\Respaldos\Universidad.bak'
with
name = 'Respaldo Diferencial 1',
description = 'Copia parcial de archivos de BD',
differential

insert into Estudiante values(1, 'Pedro')

-- Generando un segundo diferencial
backup database Universidad
to disk = 'D:\Base de Datos\Respaldos\Universidad.bak'
with
name = 'Respaldo Diferencial 2',
description = 'Copia parcial de archivos de BD',
differential

insert into Estudiante values(2, 'Juan')

backup database Universidad
to disk = 'D:\Base de Datos\Respaldos\Universidad.bak'
with
name = 'Respaldo Diferencial 3',
description = 'Copia parcial de archivos de BD',
differential

-- Visualizar archivos respaldo de la BD
restore headeronly 
from disk = 'D:\Base de Datos\Respaldos\Universidad.bak'
go
restore headeronly 
from disk = 'D:\Base de Datos\Respaldos\UniversidadComprimido.bak'

-- Backup comprimido
backup database Universidad
to disk = 'D:\Base de Datos\Respaldos\UniversidadComprimido.bak'
with
name = 'Full comprimido',
description = 'Copia Full de archivos de BD',
compression

use master
go
drop database Universidad
go

-- Restauracion de la Base de Datos Universidad
restore headeronly
from disk = 'D:\Base de Datos\Respaldos\Universidad.bak'
go

restore database Universidad
from disk = 'D:\Base de Datos\Respaldos\Universidad.bak'
with
file = 4,
noRecovery

--

use Universidad
go
select * from Estudiante

-- Respaldo del registro de transacciones SQL SERVER

sp_helpdb Universidad

backup log Universidad
to disk = 'D:\Base de Datos\Respaldos\Universidad.bak'

insert into Estudiante values(4, 'Maria')

-- Investigar como encriptar un backup. Certificados y encriptacion de respaldos de BD
