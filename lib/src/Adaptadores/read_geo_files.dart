import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:path_provider/path_provider.dart';
import 'package:validador_sigue/src/infraestructure/presentation/pages/obra/controlador/controlador.dart';
import 'package:validador_sigue/src/infraestructure/presentation/widgets/alerta_error.dart';
import 'package:validador_sigue/src/domain/assets_file_service.dart';
import 'package:path/path.dart' as p;

Future<String?> getPathGDB(
  BuildContext context,
  ControladorObraPagina recordController,
) async {
  String? gdbPath = await FilePicker.platform.getDirectoryPath();
  if (gdbPath != null) {
    if (gdbPath.endsWith('.gdb')) {
      return gdbPath;
    } else {
      errorMessage(
        context,
        'Carpeta File Geodatabase',
        'No se una Carpeta con una File Goedatabase Valida',
      );
      recordController.actualizarEstadoCargaPagina(false);
      return null;
    }
  } else {
    errorMessage(
      context,
      'Carpeta File Geodatabase',
      'No se una Carpeta con una File Goedatabase Valida',
    );
    recordController.actualizarEstadoCargaPagina(false);
  }
}

Future<List<String>?> getShapesPaths(
  BuildContext context,
  ControladorObraPagina recordController,
) async {
  const String assetsSubfolder = 'gdal';
  Directory documentsDir = await getApplicationDocumentsDirectory();
  String documentsPath = documentsDir.path;
  String programFilesDestinationPath = p.join(documentsPath, '.gdal_sigue');
  List<String> gdalFiles = [
    'freexl.dll',
    'gdal.dll',
    'geos.dll',
    'geos_c.dll',
    'iconv-2.dll',
    'libcrypto-3-x64.dll',
    'libcurl.dll',
    'libexpat.dll',
    'libmysql.dll',
    'libpng16.dll',
    'libpq.dll',
    'libssl-3-x64.dll',
    'libxml2.dll',
    'ogdi.dll',
    'ogr2ogr.exe',
    'ogrinfo.exe',
    'openjp2.dll',
    'pcre.dll',
    'proj_9.dll',
    'spatialite.dll',
    'sqlite3.dll',
    'tiff.dll',
    'xerces-c_3_2.dll',
    'zlib.dll',
    'zstd.dll',
    'Database.db',
    'SqlMacrosCreate.sql',
  ];

  await AssetFileService().copyAssetFiles(
    filenames: gdalFiles,
    assetsSubfolder: assetsSubfolder,
    destinationDir: programFilesDestinationPath,
  );
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    allowMultiple: true,
    type: FileType.custom,
    allowedExtensions: ['shp'],
  );
  if (result != null) {
    List<String> files = result.paths.map((path) => File(path!).path).toList();
    return files;
  } else {
    errorMessage(
      context,
      'Archivos Shape',
      'No se seleccionaron Archivos Shape',
    );
    recordController.actualizarEstadoCargaPagina(false);
  }
}
