import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:money_qu/utils/my_import.dart';
import 'package:another_flushbar/flushbar.dart';

void showCustomSnackBar(BuildContext context, String message) {
  Flushbar(
    message: message,
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: MyColors.red,
    duration: const Duration(seconds: 2),
  ).show(context);
}

String formatCurrency(num number, {String symbol = 'Rp '}) {
  return NumberFormat.currency(locale: 'id', symbol: symbol, decimalDigits: 0)
      .format(number);
}

Future<XFile?> pickImage() async {
  XFile? selectedImage = await ImagePicker().pickImage(
    source: ImageSource.camera,
  );

  return selectedImage;
}

Future goTo(Widget widget, BuildContext? context) async {
  if (context == null) {
    navigatorState.currentState
        ?.push(MaterialPageRoute(builder: (_) => widget));
  } else {
    Navigator.push(context, MaterialPageRoute(builder: (_) => widget));
  }
}

Future goReplace(Widget widget, BuildContext? context) async {
  if (context == null) {
    navigatorState.currentState
        ?.pushReplacement(MaterialPageRoute(builder: (_) => widget));
  } else {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => widget));
  }
}

Future goAll(Widget widget, BuildContext? context) async {
  if (context == null) {
    navigatorState.currentState?.pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => widget), (route) => false);
  } else {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => widget), (route) => false);
  }
}

goBack<T extends Object?>(BuildContext context, [T? result]) {
  navigatorState.currentState?.pop<T>(result);
}

extension CardNumber on String {
  String convertSpacing() {
    final number = this;

    return number.replaceAllMapped(
        RegExp(r".{4}"), (match) => '${match.group(0)} ');
  }
}
