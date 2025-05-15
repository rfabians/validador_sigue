import 'package:fluent_ui/fluent_ui.dart';
import 'package:cherry_toast/cherry_toast.dart';


void errorMensaje(BuildContext context, String title, String message) {
  CherryToast.error(
    disableToastAnimation: true,
    displayCloseButton: false,
    title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
    action: Text(message),
    inheritThemeColors: true,
    actionHandler: () {},
    onToastClosed: () {},
  ).show(context);
}
