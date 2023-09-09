import 'package:test/test.dart';
import 'package:track_api/track_api.dart';

void main() {
  final dateTime = DateTime.utc(
    1947,
    7,
    15,
  );

  group('Track', () {
    Track createSubject({
      int trackedUpdate = 10,
      bool didUseApp = true,
    }) {
      return Track(
        id: '1',
        trackedUpdate: trackedUpdate,
        dateTime: dateTime,
        didUseApp: didUseApp,
      );
    }

    group('constructor', () {
      test('works correctly', () {
        expect(
          createSubject,
          returnsNormally,
        );
      });
    });

    test('supports value equality', () {
      expect(
        createSubject(),
        equals(createSubject()),
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

      group('fromJson', () {
        test('works correctly', () {
          expect(
            Track.fromJson(<String, dynamic>{
              'id': '1',
              'trackedUpdate': 10,
              'dateTime': dateTime.toIso8601String(),
              'didUseApp': true
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
              'trackedUpdate': 10,
              'dateTime': dateTime.toIso8601String(),
              'didUseApp': true
            }),
          );
        });
      });
    });
  });
}
