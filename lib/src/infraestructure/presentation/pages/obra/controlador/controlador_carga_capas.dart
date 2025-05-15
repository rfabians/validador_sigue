import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ControladorMapeoCapas extends GetxController {
  String _layerName = '';
  String _entitySigue = '';

  void actualizarNombreCapa(String layerName) {
    _layerName = layerName;
    update();
  }

  void actualizarEntidadSIGUE(String entitySIGUE) {
    _entitySigue = entitySIGUE;
    update();
  }

  String obtenerNombreCapa() {
    return _layerName;
  }

  String obtenerEntidadSIGUE() {
    return _entitySigue;
  }
}
