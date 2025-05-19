import 'dart:io';

import 'package:dart_duckdb/dart_duckdb.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:validador_sigue/src/domain/entitites/entidad_sigue.dart';
import 'package:validador_sigue/src/domain/ports/repositories/repositorio_entidad_sigue.dart';
import 'package:validador_sigue/src/infraestructure/presentation/widgets/alerta_error.dart';

Future<void> cargarInformacion(
  String idProyecto,
  List<RepositorioEntidadSIGUE> listaCapas,
  BuildContext context,
) async {
  final documentosPath = await getApplicationDocumentsDirectory();
  final rutaProyecto = '${documentosPath.path}/SigueProyecto/$idProyecto';
  final databaseDestinoPath = '${rutaProyecto}/Database.db';
  final sqlMacrosCreateDestinoPath = '${rutaProyecto}/SqlMacrosCreate.sql';
  final database = await duckdb.open(databaseDestinoPath);
  final connectionDatabase = await duckdb.connect(database);
  List<String> sqlCreacionMacros = File(
    sqlMacrosCreateDestinoPath,
  ).readAsStringSync().split(';');
  for (String sql in sqlCreacionMacros) {
    if (sql.trim().isNotEmpty) {
      await connectionDatabase.execute(sql);
    }
  }
  for (RepositorioEntidadSIGUE capa in listaCapas) {
    String sql = '';
    switch (capa.tipoInformacion) {
      case TipoInformacion.obra:
        switch (capa.tipoArchivo) {
          case TipoArchivo.shp:
            switch (capa.tipoEntidadSIGUE) {
              case TipoEntidadSIGUE.nodoAcueducto:
                sql =
                    "EXECUTE cargar_nodos_acueducto_shp('${capa.rutaArchivo}')";
                break;
              case TipoEntidadSIGUE.nodoAlcantarillado:
                sql =
                    "EXECUTE cargar_nodos_alcantarillado_shp('${capa.rutaArchivo}')";
                break;
              case TipoEntidadSIGUE.lineaAcueducto:
                sql =
                    "EXECUTE cargar_lineas_acueducto_shp('${capa.rutaArchivo}')";
                break;
              case TipoEntidadSIGUE.lineaAlcantarillado:
                sql =
                    "EXECUTE cargar_lineas_alcantarillado_shp('${capa.rutaArchivo}')";
                break;
              case TipoEntidadSIGUE.areaAlcantarillado:
                sql =
                    "EXECUTE cargar_areas_alcantarillado_shp('${capa.rutaArchivo}')";
                break;
              case TipoEntidadSIGUE.noAplica:
                break;
            }

          case TipoArchivo.gdb:
            switch (capa.tipoEntidadSIGUE) {
              case TipoEntidadSIGUE.nodoAcueducto:
                sql =
                    "EXECUTE cargar_nodos_acueducto_gdb('${capa.rutaArchivo}','${capa.nombreCapa}')";
                break;
              case TipoEntidadSIGUE.nodoAlcantarillado:
                sql =
                    "EXECUTE cargar_nodos_alcantarillado_gdb('${capa.rutaArchivo}','${capa.nombreCapa}')";
                break;
              case TipoEntidadSIGUE.lineaAcueducto:
                sql =
                    "EXECUTE cargar_lineas_acueducto_gdb('${capa.rutaArchivo}','${capa.nombreCapa}')";
                break;
              case TipoEntidadSIGUE.lineaAlcantarillado:
                sql =
                    "EXECUTE cargar_lineas_alcantarillado_gdb('${capa.rutaArchivo}','${capa.nombreCapa}')";
                break;
              case TipoEntidadSIGUE.areaAlcantarillado:
                sql =
                    "EXECUTE cargar_areas_alcantarillado_gdb('${capa.rutaArchivo}','${capa.nombreCapa}')";
                break;
              case TipoEntidadSIGUE.noAplica:
                break;
            }
        }
        break;
      case TipoInformacion.diseno:
        switch (capa.tipoArchivo) {
          case TipoArchivo.shp:
            switch (capa.tipoEntidadSIGUE) {
              case TipoEntidadSIGUE.nodoAcueducto:
                sql = '';
                break;
              case TipoEntidadSIGUE.nodoAlcantarillado:
                sql = '';
                break;
              case TipoEntidadSIGUE.lineaAcueducto:
                sql = '';
                break;
              case TipoEntidadSIGUE.lineaAlcantarillado:
                sql = '';
                break;
              case TipoEntidadSIGUE.areaAlcantarillado:
                sql = '';
                break;
              case TipoEntidadSIGUE.noAplica:
                break;
            }

          case TipoArchivo.gdb:
            switch (capa.tipoEntidadSIGUE) {
              case TipoEntidadSIGUE.nodoAcueducto:
                sql = '';
                break;
              case TipoEntidadSIGUE.nodoAlcantarillado:
                sql = '';
                break;
              case TipoEntidadSIGUE.lineaAcueducto:
                sql = '';
                break;
              case TipoEntidadSIGUE.lineaAlcantarillado:
                sql = '';
                break;
              case TipoEntidadSIGUE.areaAlcantarillado:
                sql = '';
                break;
              case TipoEntidadSIGUE.noAplica:
                break;
            }
        }
    }
    if (sql.isNotEmpty) {
      try {
        await connectionDatabase.execute(sql);
      } catch (e) {
        errorMensaje(
          context,
          'Error en importación',
          'La capa ${capa.nombreCapa} no cumple con la estructura de la Norma',
        );
      }
      await connectionDatabase.execute(sql);
    }
  }
  connectionDatabase.dispose();
  database.dispose();
}
