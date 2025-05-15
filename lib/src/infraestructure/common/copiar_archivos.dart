import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as p;

Future<void> copiarArchivo(String sourcePath, String destinationPath) async {
  final sourceFile = File(sourcePath);
  File destinoArchivo = File(destinationPath);
  if (await destinoArchivo.exists()) {
  } else {
    await sourceFile.copy(destinationPath);
  }
}

class CopiarAssetsArchivos {
  Future<void> copiarArchivosAssets({
    required List<String> nombresArchivos,
    required String assetsFolder,
    required String folderDestino,
  }) async {
    final destinationDirectory = Directory(folderDestino);
    if (!await destinationDirectory.exists()) {
      await destinationDirectory.create(recursive: true);
    } else {}
    for (String nombreArchivo in nombresArchivos) {
      String assetPath = p.join('assets', assetsFolder, nombreArchivo);
      String destinationPath = p.join(folderDestino, nombreArchivo);
      File destinationFile = File(destinationPath);
      if (await destinationFile.exists()) {
        continue;
      }
      ByteData byteData = await rootBundle.load(assetPath);
      List<int> bytes = byteData.buffer.asUint8List(
        byteData.offsetInBytes,
        byteData.lengthInBytes,
      );
      await destinationFile.writeAsBytes(bytes);
    }
  }
}
