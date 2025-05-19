import 'package:get/get.dart';
import 'package:validador_sigue/src/domain/ports/repositories/repositorio_entidad_sigue.dart';

class ControladorObraPagina extends GetxController {
  bool _estaCargando = false;
  List<RepositorioEntidadSIGUE> _listaEntidadesSIGUE = [];

  void actualizarEstadoCargaPagina(bool loadingPane) {
    _estaCargando = loadingPane;
    update();
  }

  void actualizarListaEntidadesSIGUE(List<RepositorioEntidadSIGUE> lista) {
    _listaEntidadesSIGUE = lista;
    update();
  }

  bool obtenerEstadoCarga() {
    return _estaCargando;
  }

  List<RepositorioEntidadSIGUE> obtenerListaEntidadesSIGUE() {
    return _listaEntidadesSIGUE;
  }
}
