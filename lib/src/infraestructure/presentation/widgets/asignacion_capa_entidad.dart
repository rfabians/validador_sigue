import 'package:fluent_ui/fluent_ui.dart';
import 'package:validador_sigue/src/domain/ports/repositories/repositorio_entidad_sigue.dart';

void asignarListaCapas(
  BuildContext context,
  String title,
  String description,
  List<RepositorioEntidadSIGUE> listaEntidadesSIGUE,
  StatefulWidget page,
) async {
  final _ = await showDialog<String>(
    context: context,
    builder:
        (context) => ContentDialog(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.8,
            maxWidth: 700,
          ),
          title: Center(child: Text(title, style: TextStyle(fontSize: 18))),
          content: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(description),
                  const SizedBox(height: 20),
                  asignacionCapaEntidad(context, listaEntidadesSIGUE),
                ],
              ),
            ),
          ),
          actions: [
            FilledButton(
              child: const Text('Validar'),
              onPressed: () {
                Navigator.push(
                  context,
                  FluentPageRoute(builder: (context) => page),
                );
              },
            ),
            Button(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
  );
}

Widget asignacionCapaEntidad(
  BuildContext context,
  List<RepositorioEntidadSIGUE> listaEntidadesSIGUE,
) {
  List<Row> listaEntidades = [];
  List<String> entidadesSIGUE =
      RepositorioEntidadSIGUE.obtenerListaEntidadesSIGUE();

  for (RepositorioEntidadSIGUE entidad in listaEntidadesSIGUE) {
    listaEntidades.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 290, height: 35, child: Text(entidad.nombreCapa)),
          SizedBox(
            height: 35,
            width: 290,
            child: ComboBox<String>(
              items:
                  entidadesSIGUE
                      .map(
                        (entidadSIGUE) => ComboBoxItem<String>(
                          value: RepositorioEntidadSIGUE.nombreComunCapa(
                            entidad.tipoEntidadSIGUE,
                          ),
                          child: Text(entidadSIGUE),
                        ),
                      )
                      .toList(),
              onChanged: (value) {
                entidad.tipoEntidadSIGUE =
                    RepositorioEntidadSIGUE.obtenerEntidadSIGUE(value!);

                print(
                  'Entidad seleccionada: ${entidad.tipoEntidadSIGUE.toString()}',
                );
              },
              placeholder: Text('Seleccione una entidad'),
            ),
          ),
        ],
      ),
    );
  }

  return Builder(
    builder: (context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width * 0.8,
        child: ListView.builder(
          itemCount: listaEntidades.length,
          itemBuilder: (context, index) {
            return listaEntidades[index];
          },
        ),
      );
    },
  );
}
