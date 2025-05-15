import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class CapasGDB {
  Future<List<String>> obtenerListaCapas() async {
    Directory documentsDir = await getApplicationDocumentsDirectory();
    String listLayersPath = p.join(
      documentsDir.path,
      '.gdal_sigue',
      'data.txt',
    );
    File resultLayersFile = File(listLayersPath);
    List<String> layersNames = [];
    for (String line in resultLayersFile.readAsLinesSync()) {
      String trimmedLine = line.trim();
      if (trimmedLine.startsWith('Layer: ')) {
        if (trimmedLine.contains('(None)') ||
            trimmedLine.contains('DirtyAreas') ||
            trimmedLine.contains('PointErrors') ||
            trimmedLine.contains('LineErrors ') ||
            trimmedLine.contains('PolyErrors ')) {
          continue;
        }
        String layerNameToAdd = trimmedLine.replaceAll('Layer: ', '');
        layerNameToAdd = layerNameToAdd.split(' ')[0];
        layersNames.add(layerNameToAdd);
      }
    }
    return layersNames;
  }
}
