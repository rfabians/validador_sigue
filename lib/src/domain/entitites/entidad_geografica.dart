enum TipoArchivo { shp, gdb }

class EntidadGeografica {
  String rutaArchivo;
  String nombreCapa;
  TipoArchivo tipoArchivo;

  EntidadGeografica(this.rutaArchivo, this.nombreCapa, this.tipoArchivo);
}
