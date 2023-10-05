class ContactsModel {
  ContactsModel({
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  String toString() {
    return 'ContactsModel{title: $title, value: $value}';
  }
}
