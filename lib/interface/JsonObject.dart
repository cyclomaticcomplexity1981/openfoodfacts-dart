/// interface class for all serializable json model objects.
abstract class JsonObject {
  Map<String, dynamic> toJson();

  Map<String, String> toData() {
    return toDataStatic(toJson());
  }

  static Map<String, String> toDataStatic(Map<String, dynamic> json) {
    var result = <String, String>{};
    for (MapEntry<String, dynamic> entry in json.entries) {
      result.putIfAbsent(entry.key, () => entry.value.toString());
    }

    return result;
  }

  const JsonObject();

  static int? parseInt(dynamic json) {
    if (json is String) {
      return int.tryParse(json);
    } else if (json is double) {
      return json.floor();
    } else {
      return json;
    }
  }

  static double? parseDouble(dynamic json) {
    if (json is String) {
      return double.tryParse(json);
    } else if (json is int) {
      return json.toDouble();
    } else {
      return json;
    }
  }

  static bool parseBool(dynamic json) {
    if (json is String) {
      return json == '1';
    } else if (json is int) {
      return json == 1;
    } else if (json is bool) {
      return json;
    } else {
      return false;
    }
  }

  static Map<String, dynamic> removeNullEntries(
      final Map<String, dynamic> input) {
    final Map<String, dynamic> result = {};
    input.entries.forEach((element) {
      if (element.value != null) {
        result[element.key] = element.value;
      }
    });
    return result;
  }
}
