import 'dart:io';

import 'package:flutter/foundation.dart';

Future internetValidator() async {
  try {
    if (!kIsWeb){
      await InternetAddress.lookup('google.com');
    }
    return ;
  } on SocketException catch (_) {
    return throw Exception('No existe conexión a internet');
  }
}
