import 'package:get/get.dart';
import 'package:validador_sigue/src/domain/entitites/entidad_geografica.dart';
import 'package:validador_sigue/src/domain/entitites/entidad_sigue.dart';

class ControladorAsignacionCapas extends GetxController {
  List<EntidadGeografica> _listaCapas = [];
  List<EntidadSIGUE> _listaEntidadesSIGUE = [];

  List<EntidadGeografica> get listaCapas => _listaCapas;
  List<EntidadSIGUE> get listaEntidadesSIGUE => _listaEntidadesSIGUE;

  set listaCapas(List<EntidadGeografica> capas) {
    _listaCapas = capas;
    update();
  }

  set listaEntidadesSIGUE(List<EntidadSIGUE> entidades) {
    _listaEntidadesSIGUE = entidades;
    update();
  }
}
