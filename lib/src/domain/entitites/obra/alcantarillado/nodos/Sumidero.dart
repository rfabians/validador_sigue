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
      entidadSigue: 'Nodos Alcantarillado Sumidero',
      dominiosCampos: {
        'SUBTIPO': 'DomSubtip_Sumidero',
        'ESTADOENRED': 'DomEstadoRedAlc',
        'MATERIAL': 'DomMaterNodAlc',
        'CALIDADDATO': 'DomCalidadDatoAlc',
        'SISTEMA': 'DomTipoSistAlc',
        'ESTOPERA': 'DomEstadoOper',
        'TIPOINSPEC': 'DomTipoInspecc',
        'ESTREJILLA': 'DomEstadoRejilla',
        'MATREJILLA': 'DomMateRejill'
      },
      camposNoNulos: [
        "IDENTIFIC",
        "NORTE",
        "ESTE",
        "LOCALIZACIONRELATIVA",
        "C_RASANTE",
        "CONTRATO_ID",
        "ROTACION",
        "FECHA_INSP",
        "DIRECCION",
        "TAMREJILLA",
        "NDISENO",
      ],
      camposNulos: [
        "TIPO_ALIVIO",
        "TIPO_VALV_ANT",
        "C_TERRENO",
        "C_FONDO",
        "NOMBRE",
        "PROFUNDIDA",
        "CONOREDUCC",
        "MATERCONO",
        "TIPO_CONO",
        "EST_CONO",
        "INICIAL_CUENCAS",
        "CAMARASIF",
        "EST_FISICO",
        "CABEZAL",
        "EST_TAPA",
        "EST_POZO",
        "MATESCALO",
        "ESTESCALON",
        "ESTCARGUE",
        "ESTCILIND",
        "ESTCANUE",
        "COTACRESTA",
        "C_TECHO_VE",
        "LONGVERT",
        "LARGO",
        "ANCHO",
        "ALTO",
        "Q_BOMBEO",
        "TIPOBOMB",
        "UNIDBOMBEO",
        "HBOMBEO",
        "COTABOMBE",
        "VOLBOMBEO",
        "ORIGENSEC",
        "DISTORIGEN",
        "ABSCISA",
      ],
      validacionesPersonalizadas: [],
    );
  }
}
