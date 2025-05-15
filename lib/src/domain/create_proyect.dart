
import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:validador_sigue/src/infraestructure/common/copiar_archivos.dart';

Future<String> createProject() async{
  String uuid = Uuid().v1();
  Directory documentsDir = await getApplicationDocumentsDirectory();
  String documentsPath = documentsDir.path;
  String sqlPathOrigin = p.join(documentsPath, '.gdal_sigue','SqlMacrosCreate.sql');
  String databasePath = p.join(documentsPath, '.gdal_sigue','Database.db');
  String dbDestinationPath = p.join(documentsPath, 'SigueProject',uuid,'Database.db');
  String sqlDestinationPath = p.join(documentsPath, 'SigueProject',uuid,'SqlMacrosCreate.sql');
  final destinationFile = File(dbDestinationPath);
  final destinationDirectory = destinationFile.parent;
  if (!await destinationDirectory.exists()) {
    await destinationDirectory.create(recursive: true);
  }
  await copyFile(databasePath, dbDestinationPath);
  await copyFile(sqlPathOrigin, sqlDestinationPath);
  return uuid;
}