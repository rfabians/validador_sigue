import 'package:validador_sigue/src/domain/entitites/modelo_validacion.dart';

class Conduccion extends ModeloValidacion {
  Conduccion({
    required super.entidadSigue,
    required super.dominiosCampos,
    required super.camposNoNulos,
    required super.validacionesPersonalizadas,
    required super.camposNulos,
  });

  static Conduccion parametrosValidaciones() {
    return Conduccion(
      entidadSigue: 'Acueducto Líneas Conducción',
      dominiosCampos: {
        'SUBTIPO': 'Dom_Subtip_Conducc',
        'ESTADOENRED': 'Dom_EstadoRed',
        'MATERIAL': 'Dom_Material_Acue',
        'CALIDADDEDATO': 'Dom_CalidadDato',
        'TIPOINSTALACION': 'Dom_TipoInst',
        'T_SECCION': 'Dom_TipoSeccion_Acue',
      },
      camposNoNulos: [
        "CONTRATO_I",
        "AREA_TR_M2",
        "C_CLAVEI",
        "C_CLAVEF",
        "C_RASANTEI",
        "C_RASANTEF",
        "NDISENO",
      ],
      camposNulos: [
        "ESTADOLEGA",
        "COSTADO",
        "PROFUNDIDA",
        "RUGOSIDAD",
        "CODACTIVO_",
      ],
      validacionesPersonalizadas: [],
    );
  }
}
