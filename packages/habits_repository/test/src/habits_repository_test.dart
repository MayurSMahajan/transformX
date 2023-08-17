// ignore_for_file: prefer_const_constructors
import 'package:habits_repository/habits_repository.dart';
import 'package:test/test.dart';

void main() {
  group('HabitsRepository', () {
    test('can be instantiated', () {
      expect(HabitsRepository(), isNotNull);
    });
  });
}
