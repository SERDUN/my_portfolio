import 'package:jaspr/server.dart';
import 'package:jaspr_test/server_test.dart';
import 'package:my_portfolio_jaspr/app/app.dart';

void main() {
  setUpAll(() => Jaspr.initializeApp());

  testServer('renders the page as HTML on the server', (tester) async {
    tester.pumpComponent(const App());

    final response = await tester.request('/');

    expect(response.statusCode, 200);
    expect(response.document?.querySelector('main h1')?.text, 'Dmytro Serdun');
  });
}
