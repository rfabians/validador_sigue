import 'package:validador_sigue/src/domain/entitites/entidad_sigue.dart';

enum TipoError {
  errorDominio,
  campoNulo,
  estructuraDatos,
  sistemaCoordenadas,
  espacial,
}

abstract class ErrorValidacion {
  EntidadSIGUE entidadSIGUE;
  TipoError tipoError;
  String descripcion;
  String IDElemento;

  ErrorValidacion(
    this.entidadSIGUE,
    this.tipoError,
    this.descripcion,
    this.IDElemento,
  );
}
