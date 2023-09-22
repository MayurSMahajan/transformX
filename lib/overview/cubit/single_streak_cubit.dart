import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stats_repository/stats_repository.dart';

part 'single_streak_state.dart';

class SingleStreakCubit extends Cubit<SingleStreakState> {
  SingleStreakCubit({
    required String userId,
    required StatsRepository statsRepository,
  })  : _userId = userId,
        _statsRepository = statsRepository,
        super(const SingleStreakState());

  final StatsRepository _statsRepository;
  final String _userId;

  Future<void> getHabitStreak(String habitId) async {
    emit(const SingleStreakState(status: SingleStreakStatus.loading));
    try {
      final ans = await _statsRepository.getStreakSingleHabit(
        userId: _userId,
        habitId: habitId,
      );
      final onlyTrue = ans.where((el) => el);
      final count = onlyTrue.length;
      emit(
        SingleStreakState(
          status: SingleStreakStatus.success,
          count: count,
        ),
      );
    } catch (_) {
      emit(
        const SingleStreakState(
          status: SingleStreakStatus.failure,
        ),
      );
    }
  }
}
