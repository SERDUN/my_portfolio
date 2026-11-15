import 'package:domain/domain.dart';

/// How a contact card shows a channel's address: the value without the
/// `http(s)://` and `www.` in front.
extension ContactAddress on ContactModel {
  String get shownAddress => value.replaceFirst(RegExp(r'^https?://(www\.)?'), '');
}
