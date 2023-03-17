import 'dart:convert';

import 'package:marvel_challenge/src/core/constants.dart';
import 'package:crypto/crypto.dart' as crypto;

class Util {
  static List listJson(dynamic json) {
    return (json ?? []) as List;
  }

  static String? stringJson(dynamic value) {
    return value?.toString();
  }

  static bool? boolJson(dynamic value) {
    if (value != null && value.toString().isNotEmpty) {
      if (value is bool) {
        return value;
      } else if (value is String &&
          value.trim().toLowerCase().contains('true')) {
        return true;
      } else if (value is String &&
          value.trim().toLowerCase().contains('false')) {
        return false;
      }
    }
    return null;
  }

  static int? intJson(dynamic value) {
    if (value != null && value.toString().isNotEmpty) {
      if (value is double) {
        return value.toInt();
      } else if (value is int) {
        return value.toInt();
      } else {
        return int.tryParse(value.toString());
      }
    }
    return null;
  }

  static double? doubleJson(dynamic value) {
    if (value != null && value.toString().isNotEmpty) {
      if (value is double) {
        return value;
      } else if (value is int) {
        return value.toDouble();
      }
    }
    return null;
  }

  static Map<String, dynamic> getMapJson(dynamic json) {
    return (json ?? <String, dynamic>{}) as Map<String, dynamic>;
  }

  static String ts = DateTime.now().microsecondsSinceEpoch.toString();

  static String auth({String limit = 'limit=4'}) {
    String ts = DateTime.now().microsecondsSinceEpoch.toString();
    final data = ts + Constants.privateApiKey + Constants.publicApiKey;
    final content = const Utf8Encoder().convert(data);
    var md5 = crypto.md5;
    final hash = md5.convert(content);
    return '$limit&ts=$ts&apikey=${Constants.publicApiKey}&hash=$hash';
  }
}
