import 'package:dart_duckdb/dart_duckdb.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:validador_sigue/src/application/use_cases/clasificar_tipo_entidad.dart';
import 'package:validador_sigue/src/domain/entitites/error_validacion.dart';
import 'package:validador_sigue/src/domain/entitites/cantidad_entidades.dart';
import 'package:validador_sigue/src/domain/entitites/entidad_sigue.dart';
import 'package:validador_sigue/src/domain/ports/repositories/repositorio_entidad_sigue.dart';

Future<List<ErrorValidacion>> validarIntegridadAtributiva(
  BuildContext context,
  String idProyecto,
  List<RepositorioEntidadSIGUE> entidadesSIGUE,
) async {
  final documentosPath = await getApplicationDocumentsDirectory();
  final databasePath =
      '${documentosPath.path}/SigueProyecto/$idProyecto/Database.db';
  final db = await duckdb.open(databasePath);
  final conn = await duckdb.connect(db);
  for (RepositorioEntidadSIGUE entidadSIGUE in entidadesSIGUE) {
    List<CantidadEntidadSIGUE> cantidades = [];
    if (entidadSIGUE.tipoEntidadSIGUE != TipoEntidadSIGUE.noAplica) {
      String tablDatabase = tablaEntidad(entidadSIGUE);
      var data = await conn.query(
        'SELECT CLASE, COUNT(*) AS CANTIDAD FROM $tablDatabase group by 1',
      );
      var rows = data.fetchAll();
      for (final row in rows) {
        cantidades.add(
          CantidadEntidadSIGUE(
            tipoInformacion: entidadSIGUE.tipoInformacion,
            tipoEntidadSIGUE: entidadSIGUE.tipoEntidadSIGUE,
            tablaDatabase: tablDatabase,
            clase: row[0] as int,
            cantidad: row[1] as int,
          ),
        );
      }

      for (CantidadEntidadSIGUE cantidad in cantidades) {
        await validarEntidades(
          entidadSIGUE.tipoEntidadSIGUE,
          idProyecto,
          cantidad,
          conn
        );
      }
    }
  }
  return [];
}

String tablaEntidad(RepositorioEntidadSIGUE entidad) {
  String tableReferencia = '';
  switch (entidad.tipoInformacion) {
    case TipoInformacion.obra:
      switch (entidad.tipoEntidadSIGUE) {
        case (TipoEntidadSIGUE.lineaAcueducto):
          tableReferencia = 'record.model_lineas_acueducto';
          break;
        case (TipoEntidadSIGUE.nodoAcueducto):
          tableReferencia = 'record.model_nodos_acueducto';
          break;
        case (TipoEntidadSIGUE.areaAlcantarillado):
          tableReferencia = 'record.model_area_alcantarillado';
          break;
        case (TipoEntidadSIGUE.lineaAlcantarillado):
          tableReferencia = 'record.model_lineas_alcantarillado';
          break;
        case (TipoEntidadSIGUE.nodoAlcantarillado):
          tableReferencia = 'record.model_nodos_alcantarillado';
          break;
        case (TipoEntidadSIGUE.noAplica):
          tableReferencia = '';
          break;
      }
    case TipoInformacion.diseno:
      tableReferencia = 'DISEÑO';
      break;
  }
  return tableReferencia;
}
