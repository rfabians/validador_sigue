import 'package:validador_sigue/src/domain/entitites/modelo_validacion.dart';

class Aduccion extends ModeloValidacion {
  Aduccion({
    required super.dominiosCampos,
    required super.camposNoNulos,
    required super.validacionesPersonalizadas,
    required super.camposNulos,
    required super.entidadSigue
  });

  static Aduccion parametrosValidaciones() {
    return Aduccion(
      entidadSigue: 'Acueducto Líneas Aducción ',
      dominiosCampos: {
        'SUBTIPO': 'Dom_Subtip_Aducc',
        'ESTADOENRED': 'Dom_EstadoRed',
        'MATERIAL': 'Dom_Material_Acue',
        'CALIDADDEDATO': 'Dom_CalidadDato',
        'ESTADOLEGAL': 'Dom_EstadoLegal',
        'TIPOINSTALACION': 'Dom_TipoInst',
        'T_SECCION': 'Dom_TipoSeccion_Acue',
      },
      camposNoNulos: [
        "CONTRATO_ID",
        "AREA_TR_M2",
        "C_CLAVEI",
        "C_CLAVEF",
        "C_RASANTEI",
        "C_RASANTEF",
        "NDISENO",
      ],
      camposNulos: [
        "ESTADOLEGAL",
        "COSTADO",
        "PROFUNDIDAD",
        "RUGOSIDAD",
        "CONTRATO_ID",
      ],
      validacionesPersonalizadas: [],
    );
  }
}
