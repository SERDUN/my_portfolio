extension NamingExtension on String {
  String getInitials() {
    List<String> nameParts = split(" ");
    String initials = nameParts[0][0].toUpperCase() + nameParts[1][1].toUpperCase(); //Output: SR
    return initials;
  }
}
