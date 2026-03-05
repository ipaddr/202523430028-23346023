import 'package:flutter_test/flutter_test.dart';

void main() {

  test('Simple auth test', () {
    bool isLoggedIn = false;

    expect(isLoggedIn, false);

    isLoggedIn = true;

    expect(isLoggedIn, true);
  });

}