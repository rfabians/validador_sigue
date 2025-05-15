import 'package:get/get.dart';

class ControladorObraPagina extends GetxController{
  bool _loadingPane = false;
  bool _layersLoading = false;


  void actualizarEstadoCargaPagina(bool loadingPane){
    _loadingPane = loadingPane;
    update();
  }


  void updateLayersLoading(bool layersLoading){
    _layersLoading = layersLoading;
    update();
  }

  bool obtenerEstadoCarga(){
    return _loadingPane;
  }

  bool getStatusLayersLoading(){
    return _layersLoading;
  }
}