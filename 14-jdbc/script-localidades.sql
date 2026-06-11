use localidadesEjercicio
go

drop table if exists dbo.localidades
drop table if exists dbo.provincias
drop table if exists dbo.paises
go

/* -------------------------------------
   Tabla: paises
   ------------------------------------- */
create table dbo.paises
(
 cod_pais		varchar(3)		not null
				constraint PK__paises__END primary key,
 nom_pais		varchar(255)	not null
)
go

insert into dbo.paises(cod_pais, nom_pais)
values('AR', 'ARGENTINA'),
      ('BO', 'BOLIVIA'),
      ('BR', 'BRASIL'),
      ('CH', 'CHILE'),
      ('PY', 'PARAGUAY'),
      ('UY', 'URUGUAY')
go	    

/* -------------------------------------
   Tabla: provincias
   ------------------------------------- */
create table dbo.provincias
(
 cod_pais		varchar(3)		not null
				constraint FK__provincias__paises__END references dbo.paises,
 cod_provincia	varchar(3)		not null,
 nom_provincia	varchar(255)	not null
 constraint PK__provincias__END
			primary key(cod_pais, cod_provincia)
)
go

insert into dbo.provincias(cod_pais, cod_provincia, nom_provincia)
values('AR', 'B', 'BUENOS AIRES'),
      ('AR', 'C', 'CATAMARCA'),
      ('AR', 'X', 'C�RDOBA'),
      ('AR', 'P', 'LA PAMPA'),
      ('AR', 'L', 'SAN LUIS'),
      ('AR', 'F', 'SANTA FE'),
      ('AR', 'SE', 'SANTIAGO DEL ESTERO')
go

/* -------------------------------------
   Tabla: localidades
   ------------------------------------- */
create table dbo.localidades
(
 nro_localidad	integer			not null identity
				constraint PK__localidades__END primary key,
 nom_localidad	varchar(255)	not null,
 cod_pais		varchar(3)		not null,
 cod_provincia	varchar(3)		null,
 constraint FK__localidades__paises__END			
			foreign key(cod_pais) references dbo.paises,
 constraint FK__localidades__provincias__END			
			foreign key(cod_pais, cod_provincia) references dbo.provincias,
 constraint UK__localidades__provincias__END
			unique(cod_pais, cod_provincia, nom_localidad)
)
go

insert into dbo.localidades(nom_localidad, cod_pais, cod_provincia)
values('CAPITAL', 'AR', 'X'),
      ('DUMESNIL', 'AR', 'X'),
      ('MENDIOLAZA', 'AR', 'X'),
      ('LA CALERA', 'AR', 'X'),
      ('R�O CEBALLOS', 'AR', 'X'),
      ('UNQUILLO', 'AR', 'X'),
      ('SALD�N', 'AR', 'X'),
      ('VILLA ALLENDE', 'AR', 'X')   
go

/* -------------------------------------
   Consulta de paises
   ------------------------------------- */
select cod_pais,
       nom_pais
  from dbo.paises (nolock)
 order by nom_pais
go

/* -------------------------------------
   Consulta de provincias
   ------------------------------------- */
declare @cod_pais varchar(3) = 'AR'

select cod_provincia,
       nom_provincia
  from dbo.provincias (nolock)
 where cod_pais = @cod_pais
 order by nom_provincia
go

/* -------------------------------------
   Procedimiento: get_localidades
   ------------------------------------- */
create or alter procedure dbo.get_localidades
(
 @cod_pais		    varchar(3),
 @cod_provincia	    varchar(3)	    = null
)
as
begin

  if @cod_provincia = ''
     set @cod_provincia = null

  select nro_localidad,
         nom_localidad
    from dbo.localidades (nolock)
   where  cod_pais       = @cod_pais
     and (cod_provincia  = @cod_provincia
	  or  @cod_provincia is null
	 and  cod_provincia  is null)
   order by nom_localidad

end
go

-- execute dbo.get_localidades @cod_pais='AR', @cod_provincia='X'

/* -------------------------------------
   Procedimiento: ins_localidad
   ------------------------------------- */
create or alter procedure dbo.ins_localidad
(
 @nom_localidad     varchar(255),
 @cod_pais		    varchar(3),
 @cod_provincia	    varchar(3)	    = null,
 @nro_localidad	    integer		    output
)
as
begin

  if @cod_provincia = ''
     set @cod_provincia = null
 
  insert into dbo.localidades(nom_localidad, cod_pais, cod_provincia)
  values(upper(@nom_localidad), @cod_pais, @cod_provincia)
  
  set @nro_localidad = @@identity

end
go

/*
declare @nom_localidad	varchar(255)	= 'SALSIPUEDES',
		@cod_pais		varchar(3)		= 'AR',
		@cod_provincia	varchar(3)		= 'X',
		@nro_localidad	integer

execute dbo.ins_localidad @nom_localidad=@nom_localidad, @cod_pais=@cod_pais, @cod_provincia=@cod_provincia, @nro_localidad=@nro_localidad output

select @nro_localidad
*/
