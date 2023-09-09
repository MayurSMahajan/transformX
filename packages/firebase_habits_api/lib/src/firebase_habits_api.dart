import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_habits_api/src/entities/entities.dart';
import 'package:habits_api/habits_api.dart';

/// {@template firebase_habits_api}
/// repository for firebase implementation of habits api
/// {@endtemplate}
class FirebaseHabitsApi implements HabitsApi {
  /// Firebase Habits API constructor
  FirebaseHabitsApi();

  /// the top level db collection in Firestore.
  final db = FirebaseFirestore.instance.collection('data');

  @override
  Future<void> saveHabit(Habit habit, String userId) {
    final habitDoc = db.doc(userId).collection('habits').doc(habit.id);
    final habitEntityMap = HabitEntity.fromHabit(habit).toFirestore();
    return habitDoc.set(habitEntityMap);
  }

  @override
  Future<void> deleteHabit(String habitId, String userId) {
    final habitsCollection = db.doc(userId).collection('habits');
    return habitsCollection.doc(habitId).delete();
  }

  @override
  Stream<Iterable<Habit>> getHabits(String userId) {
    final habitsCollection = db.doc(userId).collection('habits');
    final ans = habitsCollection.snapshots().map(
          (snapshot) => snapshot.docs.map(
            (e) => HabitEntity.fromFirestore(e).toHabit(),
          ),
        );
    return ans;
  }
}
