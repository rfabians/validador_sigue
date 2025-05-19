enum TipoArchivo { shp, gdb }

enum TipoInformacion { obra, diseno }

enum TipoEntidadSIGUE {
  nodoAcueducto,
  nodoAlcantarillado,
  lineaAcueducto,
  lineaAlcantarillado,
  areaAlcantarillado,
  noAplica,
}

abstract class EntidadSIGUE {
  String rutaArchivo;
  String nombreCapa;
  TipoArchivo tipoArchivo;
  TipoEntidadSIGUE tipoEntidadSIGUE;
  TipoInformacion tipoInformacion;

  EntidadSIGUE(
    this.rutaArchivo,
    this.nombreCapa,
    this.tipoArchivo,
    this.tipoEntidadSIGUE,
    this.tipoInformacion,
  );
}
