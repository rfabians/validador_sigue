import 'package:dart_duckdb/dart_duckdb.dart';
import 'package:validador_sigue/src/domain/entitites/error_validacion.dart';
import 'package:validador_sigue/src/domain/entitites/cantidad_entidades.dart';
import 'package:validador_sigue/src/domain/entitites/entidad_sigue.dart';
import 'package:validador_sigue/src/domain/entitites/modelo_validacion.dart';
import 'package:validador_sigue/src/domain/entitites/obra/acueducto/lineas/aduccion.dart';
import 'package:validador_sigue/src/domain/entitites/obra/acueducto/lineas/conduccion.dart';
import 'package:validador_sigue/src/domain/entitites/obra/acueducto/lineas/linea_lateral.dart';
import 'package:validador_sigue/src/domain/entitites/obra/acueducto/lineas/red_matriz.dart';
import 'package:validador_sigue/src/domain/entitites/obra/acueducto/lineas/red_menor.dart';
import 'package:validador_sigue/src/domain/entitites/obra/acueducto/nodos/accesorio_codo.dart';
import 'package:validador_sigue/src/domain/entitites/obra/acueducto/nodos/accesorio_otros.dart';
import 'package:validador_sigue/src/domain/entitites/obra/acueducto/nodos/accesorio_reduccion.dart';
import 'package:validador_sigue/src/domain/entitites/obra/acueducto/nodos/accesorio_tapon.dart';
import 'package:validador_sigue/src/domain/entitites/obra/acueducto/nodos/accesorio_tee.dart';
import 'package:validador_sigue/src/domain/entitites/obra/acueducto/nodos/accesorio_union.dart';
import 'package:validador_sigue/src/domain/entitites/obra/acueducto/nodos/camara_acceso.dart';
import 'package:validador_sigue/src/domain/entitites/obra/acueducto/nodos/captacion.dart';
import 'package:validador_sigue/src/domain/entitites/obra/acueducto/nodos/desarenador.dart';
import 'package:validador_sigue/src/domain/entitites/obra/acueducto/nodos/estacion_bombeo.dart';
import 'package:validador_sigue/src/domain/entitites/obra/acueducto/nodos/estructura_control.dart';
import 'package:validador_sigue/src/domain/entitites/obra/acueducto/nodos/hidrante.dart';
import 'package:validador_sigue/src/domain/entitites/obra/acueducto/nodos/instrumentos_de_medicion.dart';
import 'package:validador_sigue/src/domain/entitites/obra/acueducto/nodos/macromedidor.dart';
import 'package:validador_sigue/src/domain/entitites/obra/acueducto/nodos/pila_muestreo.dart';
import 'package:validador_sigue/src/domain/entitites/obra/acueducto/nodos/planta_tratamiento.dart';
import 'package:validador_sigue/src/domain/entitites/obra/acueducto/nodos/portal.dart';
import 'package:validador_sigue/src/domain/entitites/obra/acueducto/nodos/punto_acometida.dart';
import 'package:validador_sigue/src/domain/entitites/obra/acueducto/nodos/tanque.dart';
import 'package:validador_sigue/src/domain/entitites/obra/acueducto/nodos/valvula_control.dart';
import 'package:validador_sigue/src/domain/entitites/obra/acueducto/nodos/valvula_sistema.dart';
import 'package:validador_sigue/src/domain/entitites/obra/alcantarillado/areas/drenaje_pluvial.dart';
import 'package:validador_sigue/src/domain/entitites/obra/alcantarillado/areas/drenaje_sanitario.dart';
import 'package:validador_sigue/src/domain/entitites/obra/alcantarillado/areas/pondaje.dart';
import 'package:validador_sigue/src/domain/entitites/obra/alcantarillado/lineas/linea_lateral/sumidero.dart';
import 'package:validador_sigue/src/domain/entitites/obra/alcantarillado/lineas/red_local.dart';
import 'package:validador_sigue/src/domain/entitites/obra/alcantarillado/lineas/red_troncal/canal_abierto.dart';
import 'package:validador_sigue/src/domain/entitites/obra/alcantarillado/nodos/caja_domiciliaria.dart';
import 'package:validador_sigue/src/domain/entitites/obra/alcantarillado/nodos/estructura_red.dart';
import 'package:validador_sigue/src/domain/entitites/obra/alcantarillado/nodos/pozo.dart';
import 'package:validador_sigue/src/domain/entitites/obra/alcantarillado/nodos/seccion_transversal.dart';

Future<List<ErrorValidacion>> validarEntidades(
  TipoEntidadSIGUE tipoEntidadSIGUE,
  String idProyecto,
  CantidadEntidadSIGUE agrupacion,
  Connection conn,
) async {
  List<ErrorValidacion> erroresValidacion = [];
  switch (tipoEntidadSIGUE) {
    case TipoEntidadSIGUE.nodoAcueducto:
      Map<int, ModeloValidacion Function()> asignacionClasesNodoAcueducto = {
        1: () => ValvulaSistema.parametrosValidaciones(),
        2: () => ValvulaControl.parametrosValidaciones(),
        3: () => AccesorioCodo.parametrosValidaciones(),
        4: () => AccesorioReduccion.parametrosValidaciones(),
        5: () => AccesorioTapon.parametrosValidaciones(),
        6: () => AccesorioTee.parametrosValidaciones(),
        7: () => AccesorioUnion.parametrosValidaciones(),
        8: () => AccesorioOtros.parametrosValidaciones(),
        9: () => Hidrante.parametrosValidaciones(),
        10: () => Macromedidor.parametrosValidaciones(),
        11: () => PuntoAcometida.parametrosValidaciones(),
        12: () => PilaMuestreo.parametrosValidaciones(),
        13: () => Captacion.parametrosValidaciones(),
        14: () => Desarenador.parametrosValidaciones(),
        15: () => PlantaTratamiento.parametrosValidaciones(),
        16: () => EstacionBombeo.parametrosValidaciones(),
        17: () => Tanque.parametrosValidaciones(),
        18: () => Portal.parametrosValidaciones(),
        19: () => CamaraAcceso.parametrosValidaciones(),
        20: () => EstructuraControl.parametrosValidaciones(),
        21: () => InstrumentosDeMedicion.parametrosValidaciones(),
      };
      ModeloValidacion? modelo =
          asignacionClasesNodoAcueducto[agrupacion.clase]?.call();
      if (modelo != null) {
       erroresValidacion = erroresValidacion + await validarEntidad(modelo, agrupacion, idProyecto, conn);
      }
      break;
    case TipoEntidadSIGUE.lineaAcueducto:
      Map<int, ModeloValidacion Function()> asignacionClasesLineaAcueducto = {
        1: () => RedMatriz.parametrosValidaciones(),
        2: () => Aduccion.parametrosValidaciones(),
        3: () => Conduccion.parametrosValidaciones(),
        4: () => RedMenor.parametrosValidaciones(),
        5: () => LineaLateral.parametrosValidaciones(),
      };
      ModeloValidacion? modelo =
          asignacionClasesLineaAcueducto[agrupacion.clase]?.call();
      if (modelo != null) {
        erroresValidacion = erroresValidacion + await validarEntidad(modelo, agrupacion, idProyecto, conn);
      }
      break;
    case TipoEntidadSIGUE.nodoAlcantarillado:
     Map<int, ModeloValidacion Function()> asignacionClasesNodoAlcantarillado = {
        1: () => EstructuraRed.parametrosValidaciones(),
        2: () => Pozo.parametrosValidaciones(),
        3: () => Sumidero.parametrosValidaciones(),
        4: () => CajaDomiciliaria.parametrosValidaciones(),
        5: () => Secciontransversal.parametrosValidaciones(),
      };
      ModeloValidacion? modelo =
          asignacionClasesNodoAlcantarillado[agrupacion.clase]?.call();
      if (modelo != null) {
        erroresValidacion = erroresValidacion + await validarEntidad(modelo, agrupacion, idProyecto, conn);
      }
      break;
    case TipoEntidadSIGUE.lineaAlcantarillado:
      Map<int, ModeloValidacion Function()> asignacionClasesLineaAlcantarillado = {
        1: () => Redlocal.parametrosValidaciones(),
        2: () => Canalabierto.parametrosValidaciones(),
        3: () => LineaLateral.parametrosValidaciones(),
      };
      ModeloValidacion? modelo =
          asignacionClasesLineaAlcantarillado[agrupacion.clase]?.call();
      if (modelo != null) {
        erroresValidacion = erroresValidacion + await validarEntidad(modelo, agrupacion, idProyecto, conn);
      }
      break;
    case TipoEntidadSIGUE.areaAlcantarillado:
      Map<int, ModeloValidacion Function()> asignacionClasesAreaAlcantarillado = {
        1: () => Drenajepluvial.parametrosValidaciones(),
        2: () => DrenajeSanitario.parametrosValidaciones(),
        3: () => Pondaje.parametrosValidaciones(),
      };
      ModeloValidacion? modelo =
          asignacionClasesAreaAlcantarillado[agrupacion.clase]?.call();
      if (modelo != null) {
        erroresValidacion = erroresValidacion + await validarEntidad(modelo, agrupacion, idProyecto, conn);
      }
      break;
    case TipoEntidadSIGUE.noAplica:
      break;
  }
  return erroresValidacion;
}

Future<List<ErrorValidacion>> validarEntidad(
  ModeloValidacion modeloValidacion,
  CantidadEntidadSIGUE agrupacion,
  String idProyecto,
  Connection conn,
) async {
  List<ErrorValidacion> erroresValidacion = [];

  // Validar Dominios
  Map<String, String> camposDominios = modeloValidacion.dominiosCampos;
  camposDominios.forEach((String campo, String tablaDominio) async {
    String sqlValidacionNulo = '''WITH TablaNumerada AS (
    SELECT *, ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS numero_fila
    FROM ${agrupacion.tablaDatabase} mna) SELECT $campo, numero_fila
    FROM TablaNumerada where $campo IS NULL AND CLASE = ${agrupacion.clase}''';
    var results = await conn.query(sqlValidacionNulo);
    var rows = results.fetchAll();
    if (rows.isNotEmpty) {
      for (final row in rows) {
        erroresValidacion.add(
          ErrorValidacion(
            mensaje: 'Dominio Nulo ($tablaDominio)',
            campo: campo,
            valor: 'NULL',
            claseSIGUE: modeloValidacion.entidadSigue,
            idObject: row[1] as int,
          ),
        );
      }
    }
  });
  // Validar Campos que no pueden ser Nulos

  List<String> camposNoNulos = modeloValidacion.camposNoNulos;
  for (String campo in camposNoNulos){
    String sqlValidacionNoNulos = '''
        WITH TablaNumerada AS (
          SELECT *, ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS numero_fila
          FROM ${agrupacion.tablaDatabase} mna) SELECT $campo, numero_fila
          FROM TablaNumerada where $campo IS NULL AND CLASE = ${agrupacion.clase}
          ''';
    var results = await conn.query(sqlValidacionNoNulos);
    var rows = results.fetchAll();
    if (rows.isNotEmpty) {
      for (final row in rows) {
        erroresValidacion.add(
          ErrorValidacion(
            mensaje: 'El campo no $campo no puede ser Nulo',
            campo: campo,
            valor: 'NULL',
            claseSIGUE: modeloValidacion.entidadSigue,
            idObject: row[1] as int,
          ),
        );
      }
    }
  }

  // Validar Campos que derian ser nulos
  List<String> camposNulos = modeloValidacion.camposNulos;
  for (String campo in camposNulos){
    String sqlValidacionNulos = '''
        WITH TablaNumerada AS (
          SELECT *, ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS numero_fila
          FROM ${agrupacion.tablaDatabase} mna) SELECT $campo, numero_fila
          FROM TablaNumerada where $campo IS NOT NULL AND CLASE = ${agrupacion.clase}
          ''';
    var results = await conn.query(sqlValidacionNulos);
    var rows = results.fetchAll();
    if (rows.isNotEmpty) {
      for (final row in rows) {
        erroresValidacion.add(
          ErrorValidacion(
            mensaje: 'El campo $campo no aplica para la entidad',
            campo: campo,
            valor: row[0].toString(),
            claseSIGUE: modeloValidacion.entidadSigue,
            idObject: row[1] as int,
          ),
        );
      }
    }
  }

  // Validar campos

  return erroresValidacion;
}
