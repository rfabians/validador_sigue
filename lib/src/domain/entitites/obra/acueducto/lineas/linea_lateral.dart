import 'package:validador_sigue/src/domain/entitites/modelo_validacion.dart';

class LineaLateral extends ModeloValidacion {
  LineaLateral({
    required super.entidadSigue,
    required super.dominiosCampos,
    required super.camposNoNulos,
    required super.validacionesPersonalizadas,
    required super.camposNulos,
  });

  static LineaLateral parametrosValidaciones() {
    return LineaLateral(
      entidadSigue: 'Acueducto Líneas Línea Lateral',
      dominiosCampos: {
        'SUBTIPO': 'Dom_Subtip_LinLateral_Acue',
        'ESTADOENRED': 'Dom_EstadoRed',
        'MATERIAL': 'Dom_DiamNom_Acue',
        'CALIDADDEDATO': 'Dom_CalidadDato',
        'ESTADOLEGAL': 'Dom_EstadoLegal',
        'TIPOINSTALACION': 'Dom_TipoInst',
      },
      camposNoNulos: ["CONTRATO_ID", "PROFUNDIDAD", "RUGOSIDAD"],
      camposNulos: [
        "NOMBRE",
        "COSTADO",
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
