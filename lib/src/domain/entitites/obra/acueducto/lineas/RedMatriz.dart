import 'package:validador_sigue/src/domain/entitites/modelo_validacion.dart';

class RedMatriz extends ModeloValidacion {
  RedMatriz({
    required super.entidadSigue,
    required super.dominiosCampos,
    required super.camposNoNulos,
    required super.validacionesPersonalizadas,
    required super.camposNulos,
  });

  static RedMatriz parametrosValidaciones() {
    return RedMatriz(
      entidadSigue: 'Acueducto Líneas Red Matriz',
      dominiosCampos: {
        'SUBTIPO': 'Dom_Subtip_RedMatriz',
        'ESTADOENRED': 'Dom_EstadoRed',
        'CALIDADDEDATO': 'Dom_CalidadDato',
        'TIPOINSTALACION': 'Dom_TipoInst',
        'COSTADO': 'Dom_Costado',
      },
      camposNoNulos: ["CONTRATO_I", "PROFUNDIDA", "RUGOSIDAD"],
      camposNulos: [
        "ESTADOLEGA",
        "T_SECCION",
        "C_CLAVEI",
        "C_CLAVEF",
        "C_RASANTEI",
        "C_RASANTEF",
        "NDISENO",
      ],
      validacionesPersonalizadas: [],
    );
  }
}
