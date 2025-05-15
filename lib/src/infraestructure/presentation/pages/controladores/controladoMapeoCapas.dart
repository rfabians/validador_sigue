import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';



/*

List<Widget> layersAssignment(List<GeoLayerAssing> layersList, BuildContext context) {
  List<String> entitiesSIGUE = [
    'Nodos Acueducto',
    'Líneas Acueducto',
    'Líneas Alcantarillado Sanitario',
    'Nodos Alcantarillado Sanitario',
    'Líneas Alcantarillado Pluvial Combinado',
    'Nodos Alcantarillado Pluvial Combinado',
    'No Aplica'
  ];
  List<Widget> rowsData = [rowTable('Capa', Text('Entidad SIGUE'), context)];
  for (GeoLayerAssing layer in layersList) {
    rowsData.add(
      GetBuilder(
        init: ControladorCar(),
        builder:
            (layerAssignment) =>  rowTable(
              layer.layerName,
              ComboBox<String>(
                isExpanded: false,
                value: layer.entitySIGUE.value,
                items:
                    entitiesSIGUE.map<ComboBoxItem<String>>((e) {
                      return ComboBoxItem<String>(value: e, child: Text(e));
                    }).toList(),
                onChanged: (String? entity) {
                  layer.updateEntity(entity!);
                  layerAssignment.update();
                },
                placeholder: const Text('Seleccionar Entidad SIGUE'),
              ),
              context
            ),
      ),
    );
  }
  return rowsData;
}

Widget rowTable(String key, Widget widget, BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        children: [SizedBox(width: 300, child: Text(key)), SizedBox(height: 5)],
      ),
      Column(
        children: [
          SizedBox(width: 350, child: widget),
          SizedBox(height: 5),
        ],
      ),
    ],
  );
}
*/