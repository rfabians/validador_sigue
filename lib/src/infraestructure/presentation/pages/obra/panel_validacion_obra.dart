import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import 'package:validador_sigue/src/infraestructure/presentation/pages/controladores/controlador_pagina_home.dart';
import 'package:validador_sigue/src/infraestructure/presentation/pages/obra/controlador/controlador.dart';
import 'package:validador_sigue/src/infraestructure/presentation/pages/obra/widgets/cargar_informacion.dart';

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
                    : GetBuilder(
                  init: ControladorObraPagina(),
                  builder: (controladorPaginaHome) {
                    return cargarInformacion(context);
                  },
                ),
          ),
    );
  }
}
