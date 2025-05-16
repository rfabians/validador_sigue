import 'package:get/get.dart';

/// Controlador para la página de Obra.
/// Gestiona el estado de carga de la página y notifica a los listeners cuando cambia.
class ControladorObraPagina extends GetxController {
  /// Indica si la página está en estado de carga.
  bool _estaCargando = false;

  /// Actualiza el estado de carga de la página.
  ///
  /// [loadingPane] - Nuevo estado de carga (true si está cargando, false en caso contrario).
  void actualizarEstadoCargaPagina(bool loadingPane) {
    _estaCargando = loadingPane;
    update();
  }

  /// Obtiene el estado actual de carga de la página.
  ///
  /// Retorna `true` si está cargando, `false` en caso contrario.
  bool obtenerEstadoCarga() {
    return _estaCargando;
  }
}