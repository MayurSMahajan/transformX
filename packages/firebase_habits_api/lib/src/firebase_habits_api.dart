import 'package:habits_api/habits_api.dart';

/// {@template firebase_habits_api}
/// repository for firebase implementation of habits api
/// {@endtemplate}
class FirebaseHabitsApi extends HabitsApi {
  /// {@macro firebase_habits_api}
  const FirebaseHabitsApi();

  @override
  Future<void> deleteHabit(String id) {
    // TODO: implement deleteHabit
    throw UnimplementedError();
  }

  @override
  Stream<List<Habit>> getHabits() {
    // TODO: implement getHabits
    throw UnimplementedError();
  }

  @override
  Future<void> saveHabit(Habit habit) {
    // TODO: implement saveHabit
    throw UnimplementedError();
  }
}
