import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import 'package:validador_sigue/src/infraestructure/presentation/pages/controladores/controlador_pagina_home.dart';

class PanelValidacionObra extends StatefulWidget {
  const PanelValidacionObra({super.key});

  @override
  State<PanelValidacionObra> createState() => _PanelValidacionObraState();
}

class _PanelValidacionObraState extends State<PanelValidacionObra> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ControladorPaginaHome(),
      builder:
          (controladorPaginaHome) => Container(
            child:
                controladorPaginaHome.obtenerEstadoCarga()
                    ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [ProgressRing(),const SizedBox(height: 5) ,Text('Cargando Gdal')],
                      ),
                    )
                    : Text('Hola Mundo'),
          ),
    );
  }
}

/*
class PaginaValidacionObra extends StatefulWidget {
  const PaginaValidacionObra({super.key});

  @override
  State<PaginaValidacionObra> createState() => _RecordState();
}

class _RecordState extends State<PaginaValidacionObra> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControladorObraPagina(),
    builder: (controladorObraPagina) => Center(child: Text('Hola Mundo'),),
    );
    /*
    return GetBuilder(
        init: ControladorObraPagina(),
        builder:
        controladorObraPagina) =>
        Container(
          child:
          controladorObraPagina.obte()
              ? Center(child: ProgressRing())
              : Column(
            children: [
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilledButton(
                child: SizedBox(
                    height: 75,
                    width: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FluentIcons.folder, size: 50),
                        Text('Importar GeoDatabase'),
                      ],
                    ),
                    actualizarEstadoCargaPagina),
                onPressed: () async {
                  recordController.updateStatusPane(true);
                  getPathGDB(context, recordController).then((path,) {
                    if (path != null) {
                      GdalHandler gdalhandler = GdalHandler(path);
                      gdalhandler.getLayersGDB().then((process,) async {
                        if (process) {
                          CapasGDB gdalLayers = CapasGDB();
                          List<String?> layerList =
                          await gdalLayers.obtenerListaCapas();
                          List<GeoLayerAssing> layers = [];
                          for (String? layer in layerList) {
                            if (layer != null) {
                              RxString entitySIGUE = ''.obs;
                              entitySIGUE.value = 'No Aplica';
                              layers.add(
                                GeoLayerAssing(
                                  layer,
                                  path,
                                  'GDB',
                                  entitySIGUE,
                                ),
                              );
                            }
                          }
                          recordController.updateLayerList(
                            layers,
                          );
                          recordController.updateLayersLoading(
                            actualizarEstadoCargaPaginarue,
                          );
                          recordController.updateStatusPane(
                            false,
                          );
                        } else {
                          errorMessage(
                            context,
                            'Error Lectura File Geodatabase',
                            'No se logro leer la FileGDactualizarEstadoCargaPaginath',
                          );
                          recordController.updateStatusPane(
                            false,
                          );
                        }
                      });
                    }
                  });
                },
              ),
              const SizedBox(width: 20),
              FilledButton(
                child: SizedBox(
                    height: 75,
                    width: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FluentIcons.folder, size: 50),
                        Text('Importar Shapefiles'),
                      ],
                    ),
                    actualizarEstadoCargaPagina),
                onPressed: () async {
                  recordController.updateStatusPane(true);
                  getShapesPaths(context, recordController).then((listShapes,) {
                    if (listShapes != null) {
                      List<GeoLayerAssing> layers = [];
                      for (String data in listShapes) {
                        String layer_name = data
                            .split('\\')
                            .last;
                        RxString entitySIGUE = 'No Aplica'.obs;
                        layers.add(
                          GeoLayerAssing(
                            layer_name,
                            data,
                            'SHP',
                            entitySIGUE,
                          ),
                        );
                      }

                      recordController.actualizarListaCapas(layers);
                      actualizarEstadoCargaPagina recordController
                          .updateLayersLoading(true);
                      recordController.actualizarEstadoCargaPagina(false);
                    } else {
                      recordController.updateStatusPane(false);
                    }
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 50),
          Container(
            child:
            recordController.getStatusLayersLoading()
                ? Padding(
              padding: EdgeInsets.all(12),
              child: SizedBox(
                height: 450,
                width: 800,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                    Column(
                    mainAxisAlignment:
                    MainAxisAlignment
                    .spaceBetween,
                    children: layersAssignment(
                        obtenerListadoCapas recordController.getLayerList(),
                    context,
                  ),
                ),
                Center(
                  child: FilledButton(
                      child: SizedBox(
                        width: 250,
                        height: 35,
                        child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment
                              .spaceAround,
                          children: [
                            Icon(FluentIcons.process),
                            Text('Validar'),
                          ],
                        ),
                      ),
                      actualizarEstadoCargaPagina onPressed: () async {
                recordController.updateStatusPane(true);
                String projectID =
                await createProject();
                LoadDataDB loadDataDb = LoobtenerListadoCapasordController.getLayerList());
                actualizarEstadoCargaPagina await loadDataDb.loadData(projectID);
                recordController.updateStatusPane(false);

                },
                ),
              ),
              ],
            ),
          ),
        ),
    )
        : Center(),
    ),
    ],
    )
    ,
    )
    ,
    );
*/
  }
}


 */
