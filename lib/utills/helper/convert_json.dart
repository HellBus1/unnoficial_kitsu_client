T? jsonData<T>(dynamic data, {T? defVal, T? conv}) {
  switch (T) {
    case String:
    case int:
    case bool:
    case double:
      if (data.runtimeType == T) {
        return data as T?;
      }
      return defVal;
    default:
      return conv ?? defVal;
  }
}

jsonObjectData(dynamic data, defval) {
  if (data != null) {
    return data;
  }
  return defval;
}

String jsonStringData(dynamic data, String defVal) {
  if (data.runtimeType == String) return data as String;
  return defVal;
}

bool jsonBoolData(dynamic data, bool defVal) {
  if (data.runtimeType == bool) return data as bool;
  return defVal;
}

int jsonIntData(dynamic data, int defVal) {
  if (data.runtimeType == int) return data as int;
  return defVal;
}

DateTime jsonDateTimeData(dynamic data) {
  if (data.runtimeType == DateTime) {
    return data;
  } else if (data.runtimeType == String) {
    return DateTime.parse(data);
  } else {
    return DateTime.now();
  }
}

int? jsonNullableIntData(dynamic data) {
  if (data.runtimeType == int) return data as int;
  return null;
}

double jsonDoubleData(dynamic data, double defVal) {
  if (data.runtimeType == double) return data as double;
  return defVal;
}

Map<K, V> jsonMapData<K, V>(dynamic data,
    {Map<K, V>? defVal, V Function(String, dynamic)? conv}) {
  try {
    Map<K, V> result = <K, V>{};
    Map.from(data).forEach((key, value) {
      if ((key.runtimeType == K) && (value.runtimeType == V))
        result[key] = value;
      else if (conv != null) {
        final convValue = conv(key, value);
        if (convValue.runtimeType == V) result[key] = convValue;
      } else {
        final convValue = jsonData<V>(value, defVal: null);
        if (convValue != null && convValue.runtimeType == V)
          result[key] = convValue;
      }
    });
    return result;
  } catch (error) {
    return defVal ?? <K, V>{};
  }
}

List<T> jsonList<T>(List<dynamic>? data,
    {List<T>? defVal, T Function(dynamic, int)? conv}) {
  if (T == String || T == int || T == bool || T == DateTime) {
    return List<T>.from(
        (data ?? []).map((item) => jsonData<T>(item)).whereType<T>().toList());
  } else if (conv != null) {
    return List<T>.from((data ?? [])
        .asMap()
        .map((i, item) => MapEntry(i, jsonData<T>(item, conv: conv(item, i))))
        .values
        .whereType<T>()
        .toList());
  } else {
    return defVal ?? <T>[];
  }
}
