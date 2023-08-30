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

  /// the habitsCollection in Firestore.
  final habitsCollection = FirebaseFirestore.instance.collection('habits');

  /// the user id accepted as paramater
  final String userId;

  @override
  Future<void> saveHabit(Habit habit) {
    final habitEntityMap = HabitEntity.fromHabit(habit).toFirestore();
    return habitsCollection
        .doc(userId)
        .collection(habit.id)
        .add(habitEntityMap);
  }

  @override
  Future<void> deleteHabit(String habitId) {
    return habitsCollection.doc(userId).collection(habitId).doc().delete();
  }

  @override
  Stream<List<Habit>> getHabits() {
    final iterableHabits = habitsCollection
        .snapshots()
        .map(
          (snapshot) => snapshot.docs.map(
            (e) => HabitEntity.fromFirestore(e).toHabit(),
          ),
        )
        .toList();
    return Stream.fromIterable(iterableHabits as Iterable<List<Habit>>);
  }
}
