import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import 'package:validador_sigue/src/infraestructure/common/seleccionar_archivos.dart';
import 'package:validador_sigue/src/infraestructure/data_sources/file_gdb/generar_lista_capas_gdal.dart';
import 'package:validador_sigue/src/infraestructure/presentation/pages/controladores/controlador_pagina_home.dart';
import 'package:validador_sigue/src/infraestructure/presentation/pages/obra/controlador/controlador.dart';
import 'package:validador_sigue/src/infraestructure/presentation/widgets/alerta_error.dart';

Widget cargarInformacion(BuildContext context) {
  return GetBuilder(
    init: ControladorPaginaHome(),
    builder: (controladorPaginaHome) {
      return Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FilledButton(
                child: Column(
                  children: [
                    const SizedBox(height: 5),
                    Icon(FluentIcons.open_file, size: 50, color: Colors.white),
                    const SizedBox(height: 10),
                    const Text('Importar información desde File Geodatabase'),
                  ],
                ),
                onPressed: () async {
                  String? rutaGDB = await seleccionarCarpeta(context);
                  if (rutaGDB != null) {
                    if (rutaGDB.endsWith('.gdb')) {
                      controladorPaginaHome.actualizarEstadoCarga(true);
                      List<String>? listadoCapas = await generarListadoCapasGdal(rutaGDB);
                      if(listadoCapas != null){
                        print(listadoCapas);
                      }
                      controladorPaginaHome.actualizarEstadoCarga(false);
                    } else {
                      errorMensaje(
                        context,
                        'Error Lectura GDB',
                        'El Arhivo Seleccionado no es una FileGDB',
                      );
                    }
                  }
                },
              ),
              FilledButton(
                child: Column(
                  children: [
                    const SizedBox(height: 5),
                    Icon(FluentIcons.open_file, size: 50, color: Colors.white),
                    const SizedBox(height: 10),
                    const Text('Importar información desde ShapeFiles'),
                  ],
                ),
                onPressed: () async {
                  List<String?> rutasShapes =
                      await seleccionarArchivosPorExtension(context, '.shp');
                  List<String> rutasShapesFiles = [];
                  for (String? ruta in rutasShapes) {
                    if (ruta != null) {
                      rutasShapesFiles.add(ruta);
                    }
                  }
                  if (rutasShapesFiles.isNotEmpty) {
                    print(rutasShapesFiles);
                  } else {
                    errorMensaje(
                      context,
                      'Error Lectura ShapeFiles',
                      'No se han seleccionado archivos Shape validos',
                    );
                  }
                },
              ),
            ],
          ),
        ],
      );
    },
  );
}
