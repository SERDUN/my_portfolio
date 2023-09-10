import 'bootstrap.dart';

import 'app/app.dart';

void main() async {
  await bootstrap((di) async => Application(di: di));
}
