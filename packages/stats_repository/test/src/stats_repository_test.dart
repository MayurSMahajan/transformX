// ignore_for_file: prefer_const_constructors

import 'package:habits_repository/habits_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stats_repository/stats_repository.dart';
import 'package:test/test.dart';
import 'package:track_repository/track_repository.dart';

class MockHabitsRepository extends Mock implements HabitsRepository {}

class MockTracksRepository extends Mock implements TrackRepository {}

void main() {
  group('StatsRepository', () {
    late HabitsRepository habitsRepository;
    late TrackRepository trackRepository;

    StatsRepository createSubject(
      HabitsRepository habitsRepository,
      TrackRepository trackRepository,
    ) {
      return StatsRepository(
        habitsRepository: habitsRepository,
        trackRepository: trackRepository,
      );
    }

    setUp(() {
      habitsRepository = MockHabitsRepository();
      trackRepository = MockTracksRepository();
    });

    test('can be instantiated', () {
      expect(
        createSubject(habitsRepository, trackRepository),
        isNotNull,
      );
    });
  });
}
