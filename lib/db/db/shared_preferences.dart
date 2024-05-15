import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SP {
  static final _storage = FlutterSecureStorage();

  static Future<bool> write(String key, dynamic value) async {
    if (value is String) {
      await _storage.write(key: key, value: value);
      return true;
    } else if (value is int) {
      await _storage.write(key: key, value: value.toString());
      return true;
    } else if (value is bool) {
      await _storage.write(key: key, value: value.toString());
      return true;
    } else if (value is double) {
      await _storage.write(key: key, value: value.toString());
      return true;
    } else if (value is List<String>) {
      await _storage.write(key: key, value: value.join(","));
      return true;
    }

    // Hata durumunda false döndürülebilir.
    return false;
  }

  static Future<Object?> read(String key) async {
    String? value = await _storage.read(key: key);

    if (value != null) {
      // Değerin türünü belirleme, ve dönüştürme işlemleri
      if (value.contains(",")) {
        // List<String>
        return value.split(",");
      } else if (value == "true" || value == "false") {
        // bool
        return value == "true";
      } else {
        // String, int, double
        try {
          return int.parse(value);
        } catch (e1) {
          try {
            return double.parse(value);
          } catch (e2) {
            return value;
          }
        }
      }
    }

    // Belirtilen anahtarla eşleşen bir değer bulunamazsa null döndürülür.
    return null;
  }
}
