import 'dart:io';

Future<void> copyFile(String sourcePath, String destinationPath) async {
  final sourceFile = File(sourcePath);
  await sourceFile.copy(destinationPath);
}


