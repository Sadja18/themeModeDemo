import 'package:flutter/foundation.dart';

class Consoler {
  static void printNormal(String message, {dynamic data}) {
    if (kDebugMode) {
      print("-----");
      print(message);

      if (data != null) {
        print("data");
        print(data);
      }
      print("-----");
    }
  }
}
