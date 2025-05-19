import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import 'package:validador_sigue/src/domain/entitites/entidad_sigue.dart';
import 'package:validador_sigue/src/domain/ports/repositories/repositorio_entidad_sigue.dart';
import 'package:validador_sigue/src/domain/entitites/entidad_sigue.dart';
import 'package:validador_sigue/src/domain/ports/repositories/repositorio_entidad_sigue.dart';
import 'package:validador_sigue/src/infraestructure/common/seleccionar_archivos.dart';
import 'package:validador_sigue/src/infraestructure/data_sources/file_gdb/generar_lista_capas_gdal.dart';
import 'package:validador_sigue/src/infraestructure/presentation/pages/obra/controlador/controlador.dart';
import 'package:validador_sigue/src/infraestructure/presentation/pages/obra/panel_validacion_obra.dart';
import 'package:validador_sigue/src/infraestructure/presentation/widgets/alerta_error.dart';
import 'package:validador_sigue/src/infraestructure/presentation/widgets/asignacion_capa_entidad.dart';
import 'package:validador_sigue/src/infraestructure/presentation/widgets/asignacion_capa_entidad.dart';

Widget cargarInformacion(BuildContext context) {
  List<RepositorioEntidadSIGUE> listaEntidadesSIGUE = [];
  return GetBuilder(
    init: ControladorObraPagina(),
    builder: (controladorObraPagina) {
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
                      controladorObraPagina.actualizarEstadoCargaPagina(true);
                      List<String>? listadoCapas =
                          await generarListadoCapasGdal(rutaGDB);
                      if (listadoCapas != null) {
                        for (String capa in listadoCapas) {
                          RepositorioEntidadSIGUE entidadSIGUE =
                              RepositorioEntidadSIGUE(
                                rutaGDB,
                                capa,
                                TipoArchivo.gdb,
                                TipoEntidadSIGUE.noAplica,
                                TipoInformacion.obra,
                              );
                          listaEntidadesSIGUE.add(entidadSIGUE);
                        }
                        asignarListaCapas(
                          context,
                          'Asignar capas a entidades SIGUE',
                          'Seleccione las capas que desea validar',
                          listaEntidadesSIGUE,
                          PanelValidacionObra(),
                        );
                      }
                      controladorObraPagina.actualizarEstadoCargaPagina(false);
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
                      await seleccionarArchivosPorExtension(context, 'shp');
                  List<RepositorioEntidadSIGUE> rutasShapesFiles = [];
                  for (String? ruta in rutasShapes) {
                    if (ruta != null) {
                      rutasShapesFiles.add(
                        RepositorioEntidadSIGUE(
                          ruta,
                          ruta.split('\\').last,
                          TipoArchivo.shp,
                          TipoEntidadSIGUE.noAplica,
                          TipoInformacion.obra,
                        ),
                      );
                    }
                  }
                  if (rutasShapesFiles.isNotEmpty) {
                    asignarListaCapas(
                      context,
                      'Asignar capas a entidades SIGUE',
                      'Seleccione las capas que desea validar',
                      rutasShapesFiles,
                      PanelValidacionObra(),
                    );
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
