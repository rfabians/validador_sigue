import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

Future<List<String>?> generarListadoCapasGdal(String rutaGDB) async {
  List<String> capasGDB = [];
  Directory documentsDir = await getApplicationDocumentsDirectory();
  String gdalPath = p.join(documentsDir.path, '.gdal_sigue', 'ogrinfo.exe');
  ProcessResult result = await Process.run(gdalPath, [rutaGDB]);
  if (result.exitCode == 0) {
    String resultadoOGRINFO = result.stdout.toString();
    List<String> lineasResultado = resultadoOGRINFO.split('\r\n');
    for (String linea in lineasResultado) {
      if (linea.trim().startsWith('Layer')) {
        linea = linea.replaceAll('Layer:', '').trim();
        if (!linea.contains('fras') &
            !linea.contains('DirtyAreas') &
            !linea.contains('PointErrors') &
            !linea.contains('LineErrors') &
            !linea.contains('PolyErrors')) {
          linea = linea.split('(')[0].trim();
          capasGDB.add(linea);
        }
      }
    }
    return capasGDB;
  } else {
    return null;
  }
}
