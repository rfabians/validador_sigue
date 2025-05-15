import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import 'package:validador_sigue/src/infraestructure/dependencias/ejecutable_gdal.dart';
import 'package:validador_sigue/src/infraestructure/presentation/pages/controladores/controlador_pagina_home.dart';
import 'package:validador_sigue/src/infraestructure/presentation/pages/home.dart';
import 'package:validador_sigue/src/infraestructure/presentation/widgets/mensajes_alerta.dart';

class PaginaInicio extends StatefulWidget {
  const PaginaInicio({super.key});

  @override
  State<PaginaInicio> createState() => _PaginaInicioState();
}

class _PaginaInicioState extends State<PaginaInicio> {
  ControladorPaginaHome controladorPaginaHome = ControladorPaginaHome();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/logoeaab.png', height: 150),
                  const SizedBox(height: 25),
                  Text(
                    'Empresa de Acueducto y Alcantarillado de Bogotá',
                    style: FluentTheme.of(context).typography.bodyStrong,
                  ),
                  Text(
                    'Gerencia de Tecnología',
                    style: FluentTheme.of(context).typography.bodyStrong,
                  ),
                  Text(
                    'Dirección de Información Técnica y Geográfica',
                    style: FluentTheme.of(context).typography.bodyStrong,
                  ),
                  Text(
                    'Sistema de Información Unificado Empresarial (SIGUE)',
                    style: FluentTheme.of(context).typography.bodyStrong,
                  ),
                  const SizedBox(height: 20),
                  GetBuilder(
                    init: ControladorPaginaHome(),
                    builder:
                        (controladorPaginaHome) => Button(
                          child: SizedBox(
                            height: 50,
                            width: 220,
                            child: Icon(
                              FluentIcons.caret_right_solid8,
                              color: Colors.blue,
                              size: 40,
                            ),
                          ),
                          onPressed: () {
                            controladorPaginaHome.actualizarTituloPagina(
                              'Validación Información Geográfica NS-046 Obras Acueducto y Alcantarillado',
                            );
                            controladorPaginaHome.copiarGdal();
                            mensajePopUp(
                              context,
                              'Términos de Uso',
                              'Términos de Uso',
                              Home(),
                            );
                          },
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
