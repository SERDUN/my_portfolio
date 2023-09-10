import 'package:get_it/get_it.dart';

import 'bootstrap.dart';

import 'app/app.dart';

void main() async {
  bootstrap((di) async {
    return Application(di: di);
  });
}
