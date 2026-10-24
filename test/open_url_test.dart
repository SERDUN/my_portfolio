import 'package:flutter_test/flutter_test.dart';

import 'package:my_portfolio/core/core.dart';

void main() {
  test('only web and mail links are openable', () {
    expect(isOpenable(Uri.parse('https://github.com/x')), isTrue);
    expect(isOpenable(Uri.parse('mailto:me@example.com')), isTrue);
    expect(isOpenable(Uri.parse('javascript:alert(1)')), isFalse);
    expect(isOpenable(Uri.parse('file:///etc/passwd')), isFalse);
    expect(isOpenable(null), isFalse);
  });
}
