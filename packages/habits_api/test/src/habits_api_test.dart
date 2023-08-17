// ignore_for_file: prefer_const_constructors
import 'package:habits_api/habits_api.dart';
import 'package:test/test.dart';

class TestHabitsApi extends HabitsApi {
  TestHabitsApi() : super();

  @override
  dynamic noSuchMethod(Invocation invocation) {
    return super.noSuchMethod(invocation);
  }
}

void main() {
  group('HabitsApi', () {
    test('can be constructed', () {
      expect(TestHabitsApi.new, returnsNormally);
    });
  });
}
