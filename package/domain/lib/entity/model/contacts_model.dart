/// One way to reach the owner: a label ("Email", "GitHub") and its address.
class ContactsModel {
  ContactsModel({required this.title, required this.value});

  final String title;

  /// An email address (bare or `mailto:`), a URL, or a handle.
  final String value;

  static final RegExp _address = RegExp(r'^[^@\s/:]+@[^@\s/:]+\.[^@\s/:]+$');
  static final RegExp _scheme = RegExp(r'^[a-zA-Z][a-zA-Z0-9+.-]*:');

  /// A real address (`me@example.com` or `mailto:me@example.com`); a handle
  /// such as `@ISerdun` is not.
  bool get isEmail => value.startsWith('mailto:') || _address.hasMatch(value);

  /// The address to open: `mailto:` for a bare email, anything that already
  /// has a scheme as is.
  String get link => _scheme.hasMatch(value) ? value : (isEmail ? 'mailto:$value' : value);

  /// What to show: the address without a `mailto:` prefix.
  String get displayValue => value.startsWith('mailto:') ? value.substring('mailto:'.length) : value;

  @override
  String toString() => 'ContactsModel{title: $title, value: $value}';
}
