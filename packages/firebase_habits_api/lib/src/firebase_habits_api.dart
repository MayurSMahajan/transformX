import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_habits_api/src/entities/entities.dart';
import 'package:habits_api/habits_api.dart';

/// {@template firebase_habits_api}
/// repository for firebase implementation of habits api
/// {@endtemplate}
class FirebaseHabitsApi implements HabitsApi {
  /// Firebase Habits API constructor wants the User ID
  ///
  /// this is because the habits are stored in Firestore like this:
  ///
  /// habits(collection) -> userID(collection) -> actual habits
  FirebaseHabitsApi({
    required this.userId,
  });

  /// the top level db collection in Firestore.
  final db = FirebaseFirestore.instance.collection('users');

  /// sub collection called habits used to store habits as documents
  static const subCollection = 'habits';

  /// the user id accepted as paramater
  final String userId;

  @override
  Future<void> saveHabit(Habit habit) {
    final habitsCollection = db.doc(userId).collection(subCollection);
    final habitEntityMap = HabitEntity.fromHabit(habit).toFirestore();
    return habitsCollection
        .doc(userId)
        .collection(subCollection)
        .add(habitEntityMap);
  }

  @override
  Future<void> deleteHabit(String habitId) {
    final habitsCollection = db.doc(userId).collection(subCollection);
    return habitsCollection
        .doc(userId)
        .collection(subCollection)
        .doc(habitId)
        .delete();
  }

  @override
  Stream<List<Habit>> getHabits() {
    final habitsCollection = db.doc(userId).collection(subCollection);
    final iterableHabits = habitsCollection
        .snapshots()
        .map(
          (snapshot) => snapshot.docs.map(
            (e) => HabitEntity.fromFirestore(e).toHabit(),
          ),
        )
        .toList();
    return Stream.fromFutures(iterableHabits as Iterable<Future<List<Habit>>>);
  }
}
