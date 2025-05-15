import 'dart:io';
import 'package:flutter/services.dart'; // Necesario para rootBundle
import 'package:path/path.dart' as p;

class AssetFileService {
  Future<void> copyAssetFiles({
    required List<String> filenames,
    required String assetsSubfolder,
    required String destinationDir,
  }) async {
    final destinationDirectory = Directory(destinationDir);
    if (!await destinationDirectory.exists()) {
      await destinationDirectory.create(recursive: true);
    }

    for (String fileName in filenames) {
      String assetPath = p.join('assets', assetsSubfolder, fileName);
      String destinationPath = p.join(destinationDir, fileName);
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
