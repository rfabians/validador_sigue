import 'package:get/get.dart';

class ControladorAsignacionCapas extends GetxController {
  bool _estaCargando = false;
  String _mensajeCarga = '';

  void actualizarEstadoCargaPagina(bool loadingPane) {
    _estaCargando = loadingPane;
    update();
  }

  void actualizarMensajeCarga(String mensaje) {
    _mensajeCarga = mensaje;
    update();
  }

  get estaCargando => _estaCargando;
  get mensajeCarga => _mensajeCarga;
}
