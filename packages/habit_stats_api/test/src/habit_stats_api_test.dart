// ignore_for_file: prefer_const_constructors
import 'package:habit_stats_api/habit_stats_api.dart';
import 'package:test/test.dart';

class TestHabitStatsApi extends HabitStatsApi {
  TestHabitStatsApi() : super();

  @override
  dynamic noSuchMethod(Invocation invocation) {
    return super.noSuchMethod(invocation);
  }
}

void main() {
  group('HabitStatsApi', () {
    test('can be instantiated', () {
      expect(TestHabitStatsApi.new, isNotNull);
    });
  });
}
