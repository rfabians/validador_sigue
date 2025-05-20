import 'package:validador_sigue/src/domain/entitites/modelo_validacion.dart';

class RedMenor extends ModeloValidacion {
  RedMenor({
    required super.entidadSigue,
    required super.dominiosCampos,
    required super.camposNoNulos,
    required super.validacionesPersonalizadas,
    required super.camposNulos,
  });

  static RedMenor parametrosValidaciones() {
    return RedMenor(
      entidadSigue: 'Acueducto Líneas Red Menor',
      dominiosCampos: {
        'SUBTIPO': 'Dom_Subtip_RedMenor',
        'ESTADOENRED': 'Dom_EstadoRed',
        'MATERIAL': 'Dom_Material_Acue',
        'CALIDADDEDATO': 'Dom_CalidadDato',
        'ESTADOLEGAL': 'Dom_EstadoLegal',
        'TIPOINSTALACION': 'Dom_TipoInst',
        'COSTADO': 'Dom_Costado',
      },
      camposNoNulos: ["CONTRATO_ID", "PROFUNDIDAD", "RUGOSIDAD"],
      camposNulos: [
        "NOMBRE",
        "T_SECCION",
        "AREA_TR_M2",
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
