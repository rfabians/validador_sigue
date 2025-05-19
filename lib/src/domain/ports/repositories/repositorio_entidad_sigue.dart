import 'package:validador_sigue/src/domain/entitites/entidad_sigue.dart';

class RepositorioEntidadSIGUE extends EntidadSIGUE {
  RepositorioEntidadSIGUE(
    super.rutaArchivo,
    super.nombreCapa,
    super.tipoArchivo,
    super.tipoEntidadSIGUE,
    super.tipoInformacion,
  );

  static String nombreComunCapa(TipoEntidadSIGUE tipoEntidadSIGUE) {
    switch (tipoEntidadSIGUE) {
      case TipoEntidadSIGUE.nodoAcueducto:
        return 'Nodo Acueducto';
      case TipoEntidadSIGUE.nodoAlcantarillado:
        return 'Nodo Alcantarillado';
      case TipoEntidadSIGUE.lineaAcueducto:
        return 'Linea Acueducto';
      case TipoEntidadSIGUE.lineaAlcantarillado:
        return 'Linea Alcantarillado';
      case TipoEntidadSIGUE.areaAlcantarillado:
        return 'Area Alcantarillado';
      default:
        return 'No Aplica';
    }
  }

  static List<String> obtenerListaEntidadesSIGUE() {
    return [
      'Nodo Acueducto',
      'Nodo Alcantarillado',
      'Linea Acueducto',
      'Linea Alcantarillado',
      'Area Alcantarillado',
      'No Aplica',
    ];
  }

  static TipoEntidadSIGUE obtenerEntidadSIGUE(String nombreCapa) {
    switch (nombreCapa) {
      case 'Nodo Acueducto':
        return TipoEntidadSIGUE.nodoAcueducto;
      case 'Nodo Alcantarillado':
        return TipoEntidadSIGUE.nodoAlcantarillado;
      case 'Linea Acueducto':
        return TipoEntidadSIGUE.lineaAcueducto;
      case 'Linea Alcantarillado':
        return TipoEntidadSIGUE.lineaAlcantarillado;
      case 'Area Alcantarillado':
        return TipoEntidadSIGUE.areaAlcantarillado;
      default:
        return TipoEntidadSIGUE.noAplica;
    }
  }
}
