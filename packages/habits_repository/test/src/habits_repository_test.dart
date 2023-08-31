// ignore_for_file: prefer_const_constructors
import 'package:habits_api/habits_api.dart';
import 'package:habits_repository/habits_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockHabitsApi extends Mock implements HabitsApi {}

class FakeHabit extends Fake implements Habit {}

void main() {
  group('HabitsRepository', () {
    late HabitsApi api;

    final habits = [
      Habit(
        id: '1',
        title: 'title 1',
        location: 'location 1',
        metric: Metric(title: 'metric title 1', minimum: 0, ideal: 100),
        time: Time(hour: 1, mins: 2),
        ritual: 'ritual 1',
        shortReward: 'shortReward 1',
        longReward: 'longReward 1',
        icon: 'icon 1,',
      ),
      Habit(
        id: '2',
        title: 'title 2',
        location: 'location 2',
        metric: Metric(title: 'metric title 2', minimum: 0, ideal: 200),
        time: Time(hour: 2, mins: 2),
        ritual: 'ritual 2',
        shortReward: 'shortReward 2',
        longReward: 'longReward 2',
        icon: 'icon 2,',
      ),
      Habit(
        id: '3',
        title: 'title 3',
        location: 'location 3',
        metric: Metric(title: 'metric title 3', minimum: 0, ideal: 300),
        time: Time(hour: 3, mins: 3),
        ritual: 'ritual 3',
        shortReward: 'shortReward 3',
        longReward: 'longReward 3',
        icon: 'icon 3,',
      ),
    ];

    setUpAll(() {
      registerFallbackValue(FakeHabit());
    });

    setUp(() {
      api = MockHabitsApi();
      when(() => api.getHabits()).thenAnswer((_) => Stream.value(habits));
      when(() => api.saveHabit(any())).thenAnswer((_) async {});
      when(() => api.deleteHabit(any())).thenAnswer((_) async {});
    });

    HabitsRepository createSubject() => HabitsRepository(habitsApi: api);

    group('constructor', () {
      test('works properly', () {
        expect(
          createSubject,
          returnsNormally,
        );
      });
    });

    group('getHabits', () {
      test('makes correct api request', () {
        final subject = createSubject();

        expect(
          subject.getHabits(),
          isNot(throwsA(anything)),
        );

        verify(() => api.getHabits()).called(1);
      });

      test('returns stream of current list habits', () {
        expect(
          createSubject().getHabits(),
          emits(habits),
        );
      });
    });

    group('saveHabit', () {
      test('makes correct api request', () {
        final newHabit = Habit(
          id: '4',
          title: 'title 3',
          location: 'location 3',
          metric: Metric(title: 'metric title 3', minimum: 0, ideal: 300),
          time: Time(hour: 3, mins: 3),
          ritual: 'ritual 3',
          shortReward: 'shortReward 3',
          longReward: 'longReward 3',
          icon: 'icon 3,',
        );

        final subject = createSubject();

        expect(subject.saveHabit(newHabit), completes);

        verify(() => api.saveHabit(newHabit)).called(1);
      });
    });

    group('deleteHabit', () {
      test('makes correct api request', () {
        final subject = createSubject();

        expect(subject.deleteHabit(habits[0].id), completes);

        verify(() => api.deleteHabit(habits[0].id)).called(1);
      });
    });
  });
}
