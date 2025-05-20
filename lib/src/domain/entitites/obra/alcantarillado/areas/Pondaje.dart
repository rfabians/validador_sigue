import 'package:validador_sigue/src/domain/entitites/modelo_validacion.dart';

class Pondaje extends ModeloValidacion {
  Pondaje({
    required super.entidadSigue,
    required super.dominiosCampos,
    required super.camposNoNulos,
    required super.validacionesPersonalizadas,
    required super.camposNulos,
  });

  static Pondaje parametrosValidaciones() {
    return Pondaje(
      entidadSigue: 'Area Alcantarillado Pondaje',
      dominiosCampos: {
        'CALIDADDATO': 'DomCalidadDatoAlc',
        'RECUBRIMIE': 'DomMaterLAlc',
        'CUBIERTA': 'DomVerifAlc',
        'ESNATURAL': 'DomVerifAlc',
      },
      camposNoNulos: [
        "CLASE",
        "IDENTIFIC",
        "FECHADATO",
        "CONTRATO_I",
        "VOLUMEN_M3",
        "PROFUND_M",
      ],
      camposNulos: ["W", "PENDIENTE", "IMPERMEABI", "NDISENO"],
      validacionesPersonalizadas: [],
    );
  }
}
