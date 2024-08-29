import 'dart:io';

Future<bool> checkInterNet() async {
  var check = await InternetAddress.lookup("google.com");
  if (check.isNotEmpty) {
    return true;
  } else {
    return false;
  }
}
