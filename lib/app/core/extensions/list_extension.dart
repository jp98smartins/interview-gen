extension ListExtension on List<String> {
  String get items {
    var value = '';

    for (var index = 0; index < length; index++) {
      if (index == length - 1) {
        value = "$value${this[index]}";
      } else {
        value = "$value${this[index]} | ";
      }
    }

    return value;
  }
}
