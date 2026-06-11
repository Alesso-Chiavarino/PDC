create database BibliotecaCookiesDemo
go

use BibliotecaCookiesDemo
go

drop table if exists dbo.libros
go

create table dbo.libros
(
    id_libro  int identity(1,1) primary key,
    titulo    varchar(100) not null,
    autor     varchar(100) not null,
    categoria varchar(50)  not null
)
go

insert into dbo.libros(titulo, autor, categoria)
values('Clean Code', 'Robert Martin', 'Programacion'),
      ('Effective Java', 'Joshua Bloch', 'Programacion'),
      ('Refactoring', 'Martin Fowler', 'Programacion'),
      ('Domain-Driven Design', 'Eric Evans', 'Arquitectura'),
      ('Design Patterns', 'GoF', 'Arquitectura'),
      ('The Pragmatic Programmer', 'Andrew Hunt', 'Programacion'),
      ('Spring in Action', 'Craig Walls', 'Frameworks'),
      ('Java Concurrency in Practice', 'Brian Goetz', 'Programacion'),
      ('Head First Design Patterns', 'Eric Freeman', 'Arquitectura'),
      ('SQL Performance Explained', 'Markus Winand', 'Base de Datos'),
      ('Learning SQL', 'Alan Beaulieu', 'Base de Datos'),
      ('Microservices Patterns', 'Chris Richardson', 'Arquitectura')
go

declare @texto_busqueda varchar(100) = '',
        @pagina         int = 1,
        @tam_pagina     int = 5

select id_libro,
       titulo,
       autor,
       categoria
from dbo.libros
where titulo like '%' + isnull(ltrim(rtrim(@texto_busqueda)), '') + '%'
   or autor like '%' + isnull(ltrim(rtrim(@texto_busqueda)), '') + '%'
order by titulo
offset (@pagina - 1) * @tam_pagina rows
fetch next @tam_pagina rows only
go

select count(*) total
from dbo.libros
where titulo like '%' + isnull(ltrim(rtrim(@texto_busqueda)), '') + '%'
   or autor like '%' + isnull(ltrim(rtrim(@texto_busqueda)), '') + '%'
go
