abstract class ModeloValidacion {
  Map<String, String> dominiosCampos;
  List<String> camposNoNulos;
  List<String> validacionesPersonalizadas;
  List<String> camposNulos = [];

  ModeloValidacion({
    required this.dominiosCampos,
    required this.camposNoNulos,
    required this.validacionesPersonalizadas,
    required this.camposNulos,
  });

  static ModeloValidacion parametrosValidaciones() {
    throw UnimplementedError(
      'parametrosValidaciones() must be implemented in a subclass',
    );
  }
}
