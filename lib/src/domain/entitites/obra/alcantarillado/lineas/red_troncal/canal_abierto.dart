import 'package:validador_sigue/src/domain/entitites/modelo_validacion.dart';

class Canalabierto extends ModeloValidacion {
  Canalabierto({
    required super.entidadSigue,
    required super.dominiosCampos,
    required super.camposNoNulos,
    required super.validacionesPersonalizadas,
    required super.camposNulos,
  });

  static Canalabierto parametrosValidaciones() {
    return Canalabierto(
      entidadSigue: 'Línea Alcantarillado Canal Abierto',
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
        'GRADOEST': 'DomGradEst',
        'GRADOOPER': 'DomGradOpe',
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
        "NROCONDUCTOS",
        "BASE",
        "ALTURA1",
      ],
      camposNulos: [
        "NOMBRE",
        "ALTURA2",
        "ANCHOBERMA",
        "TALUD1",
        "TALUD2",
        "NDISENO",
      ],
      validacionesPersonalizadas: ['DIAMETRO1 <> DIAMETRO2'],
    );
  }
}
