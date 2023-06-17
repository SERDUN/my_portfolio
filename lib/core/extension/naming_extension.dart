extension NamingExtension on String {
  String getInitials() {
    List<String> nameParts = split(" ");
    String initials = nameParts[0][0].toUpperCase() +
        nameParts[1][1].toUpperCase(); //Output: SR
    return initials;
  }

  String getLetter({
    int wordPosition = 0,
    int laterPosition = 0,
  }) {
    if (trim().isNotEmpty) {
      List<String> nameParts = split(" ");
      if (wordPosition <= nameParts.length && nameParts.isNotEmpty) {
        return nameParts[wordPosition][laterPosition];
      }
    }
    return "";
  }

  String getLettersFromPosition({
    int wordPosition = 0,
    int fromPosition = 0,
  }) {
    if (trim().isNotEmpty) {
      List<String> nameParts = split(" ");
      if (wordPosition <= nameParts.length && nameParts.isNotEmpty) {
        return nameParts[wordPosition].substring(fromPosition);
      }
    }
    return "";
  }
}