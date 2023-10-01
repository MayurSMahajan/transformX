import 'package:habits_api/habits_api.dart';
import 'package:test/test.dart';

void main() {
  const metric = Metric(minimum: 25, ideal: 60);
  const time = Time(hour: 12, mins: 55);

  group('Habit', () {
    Habit createSubject({
      String? id = '1',
      String title = 'title',
      String location = 'location',
      Time time = time,
      Metric metric = metric,
      String icon = 'icon',
      String ritual = 'ritual',
      String shortReward = 'shortReward',
      String longReward = 'longReward',
      int streak = 0,
      int record = 0,
    }) {
      return Habit(
        id: id,
        title: title,
        location: location,
        time: time,
        metric: metric,
        icon: icon,
        ritual: ritual,
        shortReward: shortReward,
        longReward: longReward,
        streak: streak,
        record: record,
      );
    }

    group('constructor', () {
      test('works correctly', () {
        expect(
          createSubject,
          returnsNormally,
        );
      });

      test('throws AssertionError when id is empty', () {
        expect(
          () => createSubject(id: ''),
          throwsA(isA<AssertionError>()),
        );
      });

      test('sets id if not provided', () {
        expect(
          createSubject(id: null).id,
          isNotEmpty,
        );
      });
    });

    test('supports value equality', () {
      expect(
        createSubject(),
        equals(createSubject()),
      );
    });

    test('props are correct', () {
      expect(
        createSubject().props,
        equals([
          '1',
          'title',
          'location',
          12,
          55,
          false,
          'minutes',
          25,
          60,
          'ritual',
          'shortReward',
          'longReward',
          0,
          0
        ]),
      );
    });

    group('copyWith', () {
      test('returns the same object if not arguments are provided', () {
        expect(
          createSubject().copyWith(),
          equals(createSubject()),
        );
      });

      test('retains the old value for every parameter if null is provided', () {
        expect(
          createSubject().copyWith(),
          equals(createSubject()),
        );
      });

      test('replaces every non-null parameter', () {
        expect(
          createSubject().copyWith(
            id: '2',
            title: 'new title',
            location: 'new location',
            metric: metric.copyWith(minimum: 30),
            time: time.copyWith(mins: 30),
            icon: 'new icon',
            ritual: 'new ritual',
            shortReward: 'new shortReward',
            longReward: 'new longReward',
            streak: 20,
            record: 23,
          ),
          equals(
            createSubject(
              id: '2',
              title: 'new title',
              location: 'new location',
              metric: metric.copyWith(minimum: 30),
              time: time.copyWith(mins: 30),
              icon: 'new icon',
              ritual: 'new ritual',
              shortReward: 'new shortReward',
              longReward: 'new longReward',
              streak: 20,
              record: 23,
            ),
          ),
        );
      });
    });

    group('fromJson', () {
      test('works correctly', () {
        expect(
          Habit.fromJson(<String, dynamic>{
            'id': '1',
            'title': 'title',
            'location': 'location',
            'metric': metric.toJson(),
            'time': time.toJson(),
            'icon': 'icon',
            'ritual': 'ritual',
            'shortReward': 'shortReward',
            'longReward': 'longReward',
            'streak': 0,
            'record': 0,
          }),
          equals(createSubject()),
        );
      });
    });

    group('toJson', () {
      test('works correctly', () {
        expect(
          createSubject().toJson(),
          equals(<String, dynamic>{
            'id': '1',
            'title': 'title',
            'location': 'location',
            'metric': metric.toJson(),
            'time': time.toJson(),
            'icon': 'icon',
            'ritual': 'ritual',
            'shortReward': 'shortReward',
            'longReward': 'longReward',
            'streak': 0,
            'record': 0,
          }),
        );
      });
    });
  });
}
