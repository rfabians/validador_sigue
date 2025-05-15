import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import 'package:validador_sigue/src/infraestructure/presentation/pages/obra/controlador/controlador.dart';

Widget cargarInformacion(){
  return GetBuilder(
    init: ControladorObraPagina(),
    builder: (controladorObraPagina) {
      return Column(
        children: [

        ],
      );
    },
  );
}