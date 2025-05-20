import 'package:validador_sigue/src/domain/entitites/modelo_validacion.dart';

class Drenajepluvial extends ModeloValidacion {
  Drenajepluvial({
    required super.entidadSigue,
    required super.dominiosCampos,
    required super.camposNoNulos,
    required super.validacionesPersonalizadas,
    required super.camposNulos,
  });

  static Drenajepluvial parametrosValidaciones() {
    return Drenajepluvial(
      entidadSigue: 'Area alcantarillado Drenaje Pluvial',
      dominiosCampos: {'CALIDADDATO': 'DomCalidadDatoAlc'},
      camposNoNulos: [
        "CLASE",
        "IDENTIFIC",
        "FECHADATO",
        "CONTRATO_ID",
        "W",
        "PENDIENTE",
        "IMPERMEABILIDAD",
        "NDISENO",
      ],
      camposNulos: [
        "VOLUMEN_M3",
        "RECUBRIMIE",
        "PROFUND_M",
        "CUBIERTA",
        "ESNATURAL",
      ],
      validacionesPersonalizadas: ['DIAMETRO1 <> DIAMETRO2'],
    );
  }
}
