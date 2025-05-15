import 'package:get/get.dart';
import 'package:validador_sigue/src/domain/assing_geolayer.dart';

class ControladorObraPagina extends GetxController{
  bool _loadingPane = false;
  bool _layersLoading = false;
  List<GeoLayerAssing> _layersList = [];

  void actualizarEstadoCargaPagina(bool loadingPane){
    _loadingPane = loadingPane;
    update();
  }

  void actualizarListaCapas(List<GeoLayerAssing> layerList){
    _layersList = layerList;
    update();
  }

  void updateLayersLoading(bool layersLoading){
    _layersLoading = layersLoading;
    update();
  }

  bool obtenerEstadoCarga(){
    return _loadingPane;
  }

  List<GeoLayerAssing> obtenerListadoCapas(){
    return _layersList;
  }

  bool getStatusLayersLoading(){
    return _layersLoading;
  }
}