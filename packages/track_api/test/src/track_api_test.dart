// ignore_for_file: prefer_const_constructors
import 'package:test/test.dart';
import 'package:track_api/track_api.dart';

class TestHabitsApi extends TrackApi {
  TestHabitsApi() : super();

  @override
  dynamic noSuchMethod(Invocation invocation) {
    return super.noSuchMethod(invocation);
  }
}

void main() {
  group('TrackApi', () {
    test('can be constructed', () {
      expect(TestHabitsApi.new, returnsNormally);
    });
  });
}
