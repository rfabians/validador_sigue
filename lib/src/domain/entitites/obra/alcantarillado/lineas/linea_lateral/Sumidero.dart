import 'package:validador_sigue/src/domain/entitites/modelo_validacion.dart';

class Sumidero extends ModeloValidacion {
  Sumidero({
    required super.entidadSigue,
    required super.dominiosCampos,
    required super.camposNoNulos,
    required super.validacionesPersonalizadas,
    required super.camposNulos,
  });

  static Sumidero parametrosValidaciones() {
    return Sumidero(
      entidadSigue: 'Línea Alcantarillado Sumidero',
      dominiosCampos: {
        'SISTEMA': 'DomTipoSistAlc',
        'ESTADOENRED': 'DomEstadoRedAlc',
        'MATERIAL': 'DomMaterLAlc',
        'CALIDADDATO': 'DomCalidadDatoAlc',
        'ESTADOLEGAL': 'DomEstadoLegalAlc',
        'DIAMETRO': 'DomDiamAlc',
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
        "NDISENO",
      ],
      camposNulos: [
        "MATERIAL2",
        "T_SECCION",
        "CAM_CAIDA",
        "INSTALACI",
        "MATESPPUBL",
        "PROFUNDIDAD",
        "PENDIENTE",
        "NOMBRE",
        "NROCONDUCT",
        "BASE",
        "ALTURA1",
        "ALTURA2",
        "ANCHOBERMA",
        "TALUD1",
        "TALUD2",
        "TIPOINSPEC",
        "GRADOEST",
        "GRADOOPER",
      ],
      validacionesPersonalizadas: ['SUBTTIPO <> 23'],
    );
  }
}
