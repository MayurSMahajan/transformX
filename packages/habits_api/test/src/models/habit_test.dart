import 'package:habits_api/habits_api.dart';
import 'package:test/test.dart';

void main() {
  group('Habit', () {
    Habit createSubject({
      String? id = '1',
      String title = 'title',
      int hour = 12,
      int mins = 55,
      bool isAm = false,
      String location = 'location',
      String icon = 'icon',
    }) {
      return Habit(
        id: id,
        title: title,
        hour: hour,
        mins: mins,
        location: location,
        icon: icon,
        isAm: isAm,
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
          '1', // id
          'title', // title
          12,
          55,
          'location', // description
          false,
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
            hour: 8,
            mins: 45,
            location: 'new location',
            isAm: true,
          ),
          equals(
            createSubject(
              id: '2',
              title: 'new title',
              hour: 8,
              mins: 45,
              location: 'new location',
              isAm: true,
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
            'hour': 12,
            'mins': 55,
            'isAm': false,
            'icon': 'icon',
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
            'hour': 12,
            'mins': 55,
            'isAm': false,
            'icon': 'icon',
          }),
        );
      });
    });
  });
}
