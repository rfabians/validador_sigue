import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:validador_sigue/src/infraestructure/presentation/widgets/alerta_error.dart';

Future<String?> seleccionarCarpeta(BuildContext context) async {
  String? carpetaSeleccionada = await FilePicker.platform.getDirectoryPath();
  if (carpetaSeleccionada != null) {
    return carpetaSeleccionada;
  } else {
    errorMensaje(
      context,
      'Carga Archivos',
      'No se ha seleccionado un directorio valido',
    );
  }
  return null;
}

Future<List<String?>> seleccionarArchivosPorExtension(
  BuildContext context,
  String extensionArchivo,
) async {
  List<String?> archivos = [];
  FilePickerResult? resultado = await FilePicker.platform.pickFiles(
    allowMultiple: true,
    type: FileType.custom,
    allowedExtensions: [extensionArchivo],
  );
  if (resultado != null) {
    List<String> archivos =
        resultado.paths.map((rutaArchivo) => rutaArchivo!).toList();
    return archivos;
  } else {
    return archivos;
  }
}
