import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:validador_sigue/src/infraestructure/dependencias/ejecutable_gdal.dart';

class ControladorPaginaHome extends GetxController {
  String _tituloPagina = 'Validador de Información Geográfica SIGUE';
  bool _estaCargando = true;

  void actualizarTituloPagina(String tituloPagina) {
    _tituloPagina = tituloPagina;
    update();
  }

  String obtenerTituloPagina() {
    return _tituloPagina;
  }

  Future<void> copiarGdal() async {
    _estaCargando = true;
    update();
    GdalAplicacion gdalAplicacion = GdalAplicacion();
    await gdalAplicacion.copiarLibreriaGdal();
    _estaCargando = false;
    update();
  }

  void actualizarEstadoCarga(bool estaCargando) {
    _estaCargando = estaCargando;
    update();
  }

  bool obtenerEstadoCarga() {
    return _estaCargando;
  }
}
