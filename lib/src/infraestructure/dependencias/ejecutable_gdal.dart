import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:validador_sigue/src/infraestructure/common/copiar_archivos.dart';

class GdalAplicacion {

  String ogrinfoExecutable = 'ogrinfo.exe';
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

  String mainExecutable = 'ogrinfo.exe';


  Future<void> copiarLibreriaGdal() async {
    const String assetsSubfolder = 'gdal';
    Directory documentsDir = await getApplicationDocumentsDirectory();
    String documentsPath = documentsDir.path;
    String programFilesDestinationPath = p.join(documentsPath, '.gdal_sigue');
    CopiarAssetsArchivos copiarAssetsArchivos = CopiarAssetsArchivos();
    await copiarAssetsArchivos.copiarArchivosAssets(
      nombresArchivos: gdalFiles,
      assetsFolder: assetsSubfolder,
      folderDestino: programFilesDestinationPath,
    );
    await Future.delayed(Duration(seconds: 2));
  }
}
