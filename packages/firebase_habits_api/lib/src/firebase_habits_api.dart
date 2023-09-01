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
  FirebaseHabitsApi();

  /// the top level db collection in Firestore.
  final db = FirebaseFirestore.instance;

  @override
  Future<void> saveHabit(Habit habit, String userId) {
    final habitsCollection = db.collection(userId);
    final habitEntityMap = HabitEntity.fromHabit(habit).toFirestore();
    return habitsCollection.add(habitEntityMap);
  }

  @override
  Future<void> deleteHabit(String habitId, String userId) {
    final habitsCollection = db.collection(userId);
    return habitsCollection.doc(habitId).delete();
  }

  @override
  Stream<Iterable<Habit>> getHabits(String userId) {
    final habitsCollection = db.collection(userId);
    final ans = habitsCollection.snapshots().map(
          (snapshot) => snapshot.docs.map(
            (e) => HabitEntity.fromFirestore(e).toHabit(),
          ),
        );
    return ans;
  }
}
