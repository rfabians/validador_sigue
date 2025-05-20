import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:validador_sigue/src/infraestructure/common/copiar_archivos.dart';
import 'package:validador_sigue/src/infraestructure/presentation/widgets/alerta_error.dart';

Future<String> crearProyecto(BuildContext context) async {
  String idProyecto = Uuid().v4();
  final documentosPath = await getApplicationDocumentsDirectory();
  final rutaProyecto = '${documentosPath.path}/SigueProyecto/$idProyecto';
  final directorioProyecto = Directory(rutaProyecto);
  if (await directorioProyecto.exists()) {
    if (context.mounted){
errorMensaje(context, 'Error Creación Proyecto', 'El proyecto ya existe');
    }
    
  } else {
    await directorioProyecto.create(recursive: true);
    final databaseModelPath = '${documentosPath.path}/.gdal_sigue/Database.db';
    final sqlMacrosCreatePath =
        '${documentosPath.path}/.gdal_sigue/SqlMacrosCreate.sql';
    final databaseDestinoPath = '${directorioProyecto.path}/Database.db';
    final sqlMacrosCreateDestinoPath =
        '${directorioProyecto.path}/SqlMacrosCreate.sql';
    await copiarArchivo(databaseModelPath, databaseDestinoPath);
    await copiarArchivo(sqlMacrosCreatePath, sqlMacrosCreateDestinoPath);
  }
  return idProyecto;
}
