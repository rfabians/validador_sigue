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
                  AsignacionCapaEntidad(
                    listaEntidadesSIGUE: listaEntidadesSIGUE,
                  ),
                ],
              ),
            ),
          ),
          actions: [
            FilledButton(
              child: const Text('Validar'),
              onPressed: () {
                for (RepositorioEntidadSIGUE capa in listaEntidadesSIGUE) {
                  print(
                    RepositorioEntidadSIGUE.nombreComunCapa(
                      capa.tipoEntidadSIGUE,
                    ),
                  );
                }
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

class AsignacionCapaEntidad extends StatefulWidget {
  List<RepositorioEntidadSIGUE> listaEntidadesSIGUE = [];
  AsignacionCapaEntidad({super.key, required this.listaEntidadesSIGUE});

  @override
  State<AsignacionCapaEntidad> createState() => _AsignacionCapaEntidadState();
}

class _AsignacionCapaEntidadState extends State<AsignacionCapaEntidad> {
  @override
  Widget build(BuildContext context) {
    List<Row> listaEntidades = [];
    List<String> entidadesSIGUE =
        RepositorioEntidadSIGUE.obtenerListaEntidadesSIGUE();

    for (RepositorioEntidadSIGUE entidad in widget.listaEntidadesSIGUE) {
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
                              RepositorioEntidadSIGUE.obtenerEntidadSIGUE(
                                entidadSIGUE,
                              ),
                            ),
                            child: Text(entidadSIGUE),
                          ),
                        )
                        .toList(),
                onChanged: (String? valorSeleccionado) {
                  setState(() {
                    entidad.tipoEntidadSIGUE =
                        RepositorioEntidadSIGUE.obtenerEntidadSIGUE(
                          valorSeleccionado!,
                        );
                    print(
                      RepositorioEntidadSIGUE.nombreComunCapa(
                        entidad.tipoEntidadSIGUE,
                      ),
                    );
                  });
                },
                placeholder: Text(
                  RepositorioEntidadSIGUE.nombreComunCapa(
                    entidad.tipoEntidadSIGUE,
                  ),
                ),
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
}
