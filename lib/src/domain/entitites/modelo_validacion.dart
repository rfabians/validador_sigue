abstract class ModeloValidacion {
  Map<String, String> dominiosCampos;
  List<String> camposNoNulos;
  List<String> validacionesPersonalizadas;
  List<String> camposNulos = [];
  String entidadSigue;

  ModeloValidacion({
    required this.dominiosCampos,
    required this.camposNoNulos,
    required this.validacionesPersonalizadas,
    required this.camposNulos,
    required this.entidadSigue
  });

  static ModeloValidacion parametrosValidaciones() {
    throw UnimplementedError(
      'parametrosValidaciones() must be implemented in a subclass',
    );
  }



}
