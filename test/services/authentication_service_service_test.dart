import 'package:flutter_test/flutter_test.dart';
import 'package:observable_flutter/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('AuthenticationServiceServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
