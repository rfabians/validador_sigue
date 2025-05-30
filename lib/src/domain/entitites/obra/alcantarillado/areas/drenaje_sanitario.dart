import 'package:validador_sigue/src/domain/entitites/modelo_validacion.dart';

class DrenajeSanitario extends ModeloValidacion {
  DrenajeSanitario({
    required super.entidadSigue,
    required super.dominiosCampos,
    required super.camposNoNulos,
    required super.validacionesPersonalizadas,
    required super.camposNulos,
  });

  static DrenajeSanitario parametrosValidaciones() {
    return DrenajeSanitario(
      entidadSigue: 'Area Alcantarillado Drenaje Sanitario',
      dominiosCampos: {'CALIDADDATO': 'DomCalidadDatoAlc'},
      camposNoNulos: ["CLASE", "IDENTIFIC", "FECHADATO", "CONTRATO_ID"],
      camposNulos: [
        "VOLUMEN_M3",
        "RECUBRIMIE",
        "PROFUND_M",
        "CUBIERTA",
        "ESNATURAL",
        "W",
        "PENDIENTE",
        "IMPERMEABILIDAD",
        "NDISENO",
      ],
      validacionesPersonalizadas: [
      ],
    );
  }
}
