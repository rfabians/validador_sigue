import 'package:validador_sigue/src/domain/entitites/modelo_validacion.dart';

class ConduccionCerrada extends ModeloValidacion {
  ConduccionCerrada({
    required super.entidadSigue,
    required super.dominiosCampos,
    required super.camposNoNulos,
    required super.validacionesPersonalizadas,
    required super.camposNulos,
  });

  static ConduccionCerrada parametrosValidaciones() {
    return ConduccionCerrada(
      entidadSigue: 'Red Alcantarillado Red Troncal Conducción Cerrada',
      dominiosCampos: {
        'SUBTIPO': 'DomSubtipRedTroncal',
        'SISTEMA': 'DomTipoSistAlc',
        'ESTADOENRED': 'DomEstadoRedAlc',
        'MATERIAL': 'DomMaterLAlc',
        'MATERIAL2': 'DomMaterLAlc',
        'CALIDADDATO': 'DomCalidadDatoAlc',
        'ESTADOLEGAL': 'DomEstadoLegalAlc',
        'DIAMETRO': 'DomDiamAlc',
        'T_SECCION': 'DomTipoSeccionAlc',
        'CAM_CAIDA': 'DomCamaraCaida',
        'INSTALACI': 'DomMetodInst',
        'MATESPPUBL': 'DomMaterEspPubAlc',
        'TIPOINSPEC': 'DomTipoInspecc',
      },
      camposNoNulos: [
        "N_INICIAL",
        "N_FINAL",
        "FECHAINST",
        "CONTRATO_ID",
        "C_CLAVEI",
        "C_CLAVEF",
        "C_BATEAI",
        "C_BATEAF",
        "C_RASATEI",
        "C_RASANTEF",
        "PROFUNDIDAD",
        "PENDIENTE",
        "NROCONDUCT",
        "BASE",
        "ALTURA1",
        "ALTURA2",
        "ANCHOBERMA",
        "TALUD1",
        "TALUD2",
        "NDISENO",
      ],
      camposNulos: ["CAM_CAIDA", "TIPOINSPEC", "GRADOEST", "GRADOOPER"],
      validacionesPersonalizadas: [],
    );
  }
}
