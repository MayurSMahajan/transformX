import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stats_repository/stats_repository.dart';

part 'statistics_event.dart';
part 'statistics_state.dart';

class StatisticsBloc extends Bloc<StatisticsEvent, StatisticsState> {
  StatisticsBloc({
    required StatsRepository statsRepository,
    required String userId,
  })  : _statsRepository = statsRepository,
        _userId = userId,
        super(const StatisticsState()) {
    on<StatisticsRequestedEvent>(_onStatisticsRequested);
  }

  final String _userId;
  final StatsRepository _statsRepository;

  Future<void> _onStatisticsRequested(
    StatisticsRequestedEvent event,
    Emitter<StatisticsState> emit,
  ) async {
    emit(state.copyWith(status: StatisticsStatus.loading));
    try {
      final stats = await _statsRepository.getAllStatistics(userId: _userId);
      emit(state.copyWith(status: StatisticsStatus.success, stats: stats));
    } catch (_) {
      emit(state.copyWith(status: StatisticsStatus.error));
    }
  }
}
