import 'package:get/get.dart';

class GeoLayerAssing {
  final String typeFile;
  final String pathFile;
  final RxString entitySIGUE;
  final String layerName;

  GeoLayerAssing(
    this.layerName,
    this.pathFile,
    this.typeFile,
    this.entitySIGUE
  );

  void updateEntity(String entity) {
    entitySIGUE.value = entity;
  }
}
