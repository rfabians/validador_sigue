
import 'package:validador_sigue/src/domain/entitites/entidad_sigue.dart';

class CantidadEntidadSIGUE {
  TipoInformacion tipoInformacion;
  TipoEntidadSIGUE tipoEntidadSIGUE;
  String tablaDatabase;
  int clase;
  int cantidad;

  CantidadEntidadSIGUE({
    required this.tipoInformacion,
    required this.tipoEntidadSIGUE,
    required this.tablaDatabase,
    required this.clase,
    required this.cantidad
  });
}