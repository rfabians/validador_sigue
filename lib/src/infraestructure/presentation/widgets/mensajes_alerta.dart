import 'package:fluent_ui/fluent_ui.dart';

void mensajePopUp(
  BuildContext context,
  String title,
  String description,
  StatefulWidget page,
) async {
  final _ = await showDialog<String>(
    context: context,
    builder:
        (context) => ContentDialog(
          title: Text(title, style: TextStyle(fontSize: 18)),
          content: Text(description),
          actions: [
            FilledButton(
              child: const Text('Aceptar'),
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
