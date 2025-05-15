import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:dart_duckdb/dart_duckdb.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:developer' as developer;

import 'package:validador_sigue/src/domain/assing_geolayer.dart';

class SigueEntities {
  static const String nodosAcueducto = 'Nodos Acueducto';
  static const String lineasAcueducto = 'Líneas Acueducto';
  static const String nodosAlcantarilladoSanitario = 'Nodos Alcantarillado Sanitario';
  static const String lineasAlcantarilladoSanitario = 'Líneas Alcantarillado Sanitario';
  static const String nodosAlcantarilladoPluvialCombinado = 'Nodos Alcantarillado Pluvial Combinado';
  static const String lineasAlcantarilladoPluvialCombinado = 'Líneas Alcantarillado Pluvial Combinado';
}

class LoadDataDB {
  final List<GeoLayerAssing> layerAssing;

  LoadDataDB(this.layerAssing);
  static final Map<String, Map<String, String>> _sqlMacroMap = {
    'SHP': {
      SigueEntities.nodosAcueducto: "EXECUTE cargar_nodos_acueducto_shp('%pathFile%');",
      SigueEntities.lineasAcueducto: "EXECUTE cargar_lineas_acueducto_shp('%pathFile%');",
      SigueEntities.nodosAlcantarilladoSanitario: "EXECUTE cargar_nodos_alcantarillado_shp('%pathFile%');",
      SigueEntities.lineasAlcantarilladoSanitario: "EXECUTE cargar_lineas_alcantarillado_shp('%pathFile%');",
      SigueEntities.nodosAlcantarilladoPluvialCombinado: "EXECUTE cargar_nodos_alcantarillado_shp('%pathFile%');",
      SigueEntities.lineasAlcantarilladoPluvialCombinado: "EXECUTE cargar_lineas_alcantarillado_shp('%pathFile%');",
    },
    'GDB': {
      SigueEntities.nodosAcueducto: "EXECUTE cargar_nodos_acueducto_gdb('%pathFile%','%layerName%');",
      SigueEntities.lineasAcueducto: "EXECUTE cargar_lineas_acueducto_gdb('%pathFile%','%layerName%');",
      SigueEntities.nodosAlcantarilladoSanitario: "EXECUTE cargar_nodos_alcantarillado_gdb('%pathFile%','%layerName%');",
      SigueEntities.lineasAlcantarilladoSanitario: "EXECUTE cargar_lineas_alcantarillado_gdb('%pathFile%','%layerName%');",
      SigueEntities.nodosAlcantarilladoPluvialCombinado: "EXECUTE cargar_nodos_alcantarillado_gdb('%pathFile%','%layerName%');",
      SigueEntities.lineasAlcantarilladoPluvialCombinado: "EXECUTE cargar_lineas_alcantarillado_gdb('%pathFile%','%layerName%');",
    },
  };

  Future<void> loadData(String uuid) async {
    Database? db;
    Connection? connection;

    try {
      Directory documentsDir = await getApplicationDocumentsDirectory();
      String projectDir = p.join(documentsDir.path, 'SigueProject', uuid);
      String databasePath = p.join(projectDir, 'Database.db');
      String sqlMacrosPath = p.join(projectDir, 'SqlMacrosCreate.sql');

      db = await duckdb.open(databasePath);
      connection = await duckdb.connect(db);

      File sqlMacrosFile = File(sqlMacrosPath);
      if (await sqlMacrosFile.exists()) {
        String sqlQuerys = await sqlMacrosFile.readAsString();
        for (String query in sqlQuerys.split(';')) {
          String trimmedQuery = query.trim();
          if (trimmedQuery.isNotEmpty) {
            developer.log('Executing macro: $trimmedQuery'); // Log para depuración
            await connection.execute(trimmedQuery);
          }
        }
      } else {
        developer.log('Warning: SQL macros file not found at $sqlMacrosPath');
      }


      for (GeoLayerAssing geoLayerAssing in layerAssing) {
        String? sqlTemplate = _sqlMacroMap[geoLayerAssing.typeFile]?[geoLayerAssing.entitySIGUE.value];

        if (sqlTemplate != null) {
          String sqlQuery = _buildSqlQuery(sqlTemplate, geoLayerAssing);
          print('Executing data load query: $sqlQuery'); // Log para depuración
          await connection.execute(sqlQuery);
        } else {
          developer.log('Warning: No SQL macro defined for typeFile "${geoLayerAssing.typeFile}" and entitySIGUE "${geoLayerAssing.entitySIGUE.value}"');
        }
      }

    } catch (e) {
      // Manejar el error. Puedes loggearlo, mostrar un mensaje al usuario, etc.
      developer.log('Error loading data into DuckDB: $e');
      // Opcionalmente, relanzar el error si quieres que sea manejado externamente
      // rethrow;
    } finally {
      // Asegurar que la conexión y la base de datos se cierren
      if (connection != null) {
        await connection.dispose();
        developer.log('DuckDB connection disposed.');
      }
      if (db != null) {
        await db.dispose();
        developer.log('DuckDB database disposed.');
      }
    }
  }

  String _buildSqlQuery(String template, GeoLayerAssing geoLayerAssing) {
    String query = template.replaceAll('%pathFile%', geoLayerAssing.pathFile);
    if (geoLayerAssing.typeFile == 'GDB') {
      query = query.replaceAll('%layerName%', geoLayerAssing.layerName ?? ''); 
    }
    return query;
  }
}

