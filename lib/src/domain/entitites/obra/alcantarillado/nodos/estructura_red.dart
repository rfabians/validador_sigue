import 'package:validador_sigue/src/domain/entitites/modelo_validacion.dart';

class EstructuraRed extends ModeloValidacion {
  EstructuraRed({
    required super.entidadSigue,
    required super.dominiosCampos,
    required super.camposNoNulos,
    required super.validacionesPersonalizadas,
    required super.camposNulos,
  });

  static EstructuraRed parametrosValidaciones() {
    return EstructuraRed(
      entidadSigue: 'Nodo Alcantarillado Estructura de Red',
      dominiosCampos: {
        'MARGENDESC': 'DomMargenDesc',
        'SUBTIPO': 'DomSubtip_EstrRed',
        'TIPO_ALIVIO': 'DomTipoAliv',
        'TIPO_VALV_ANT': 'DomTipValAntir',
        'ESTADOENRED': 'DomEstadoRedAlc',
        'MATERIAL': 'DomMaterNodAlc',
        'CALIDADDATO': 'DomCalidadDatoAlc',
        'SISTEMA': 'DomTipoSistAlc',
        'EST_FISICO': 'DomEstadoFisAlc',
        'CABEZAL': 'DomVerifAlc',
      },
      camposNoNulos: [
        "IDENTIFIC",
        "NORTE",
        "ESTE",
        "FECHADATO",
        "LOCALIZACIONRELATIVA",
        "C_RASANTE",
        "C_FONDO",
        "CONTRATO_ID",
        "ROTACION",
        "NDISENO",
      ],
      camposNulos: [
        "C_TERRENO",
        "EST_TAPA",
        "EST_POZO",
        "MATESCALO",
        "ESTESCALON",
        "ESTCARGUE",
        "ESTCILIND",
      ],
      validacionesPersonalizadas: ['DIAMETRO1 <> DIAMETRO2'],
    );
  }
}
