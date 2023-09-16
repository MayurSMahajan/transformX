import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stats_repository/stats_repository.dart';

part 'streak_state.dart';

class StreakCubit extends Cubit<StreakState> {
  StreakCubit({
    required String userId,
    required StatsRepository statsRepository,
  })  : _userId = userId,
        _statsRepository = statsRepository,
        super(const StreakState());

  final StatsRepository _statsRepository;
  final String _userId;

  Future<void> getStreak() async {
    emit(const StreakState(status: StreakStatus.loading));
    try {
      final ans = await _statsRepository.getStreakAllHabits(userId: _userId);
      emit(StreakState(status: StreakStatus.success, streakList: ans));
    } catch (_) {
      emit(const StreakState(status: StreakStatus.failure));
    }
  }
}
