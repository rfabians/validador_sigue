import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import 'package:validador_sigue/src/infraestructure/presentation/pages/Obra/panel_validacion_obra.dart';
import 'package:validador_sigue/src/infraestructure/presentation/pages/controladores/controlador_pagina_home.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int indexPane = 0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ControladorPaginaHome(),
      builder: (controladorPaginaHome) {

        return NavigationView(
          appBar: NavigationAppBar(
            automaticallyImplyLeading: false,
            title: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Align(
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      controladorPaginaHome.obtenerTituloPagina(),
                      style: FluentTheme.of(context).typography.bodyStrong,
                    ),
                  ),
                ),
              ],
            ),
          ),
          pane: NavigationPane(
            onChanged: (index) {
              setState(() {
                indexPane = index;
              });
            },
            displayMode: PaneDisplayMode.compact,
            selected: indexPane,
            items: [
              PaneItem(
                icon: Icon(FluentIcons.map_layers),
                body: PanelValidacionObra(),
                title: Text('Validación NS-046'),
              ),
            ],
          ),
        );
      },
    );
  }
}
