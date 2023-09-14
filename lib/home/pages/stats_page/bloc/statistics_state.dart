part of 'statistics_bloc.dart';

enum StatisticsStatus {
  initial,
  loading,
  success,
  error,
}

final class StatisticsState extends Equatable {
  const StatisticsState({
    this.status = StatisticsStatus.initial,
    this.stats = const [],
  });

  final StatisticsStatus status;
  final List<Statistics> stats;

  StatisticsState copyWith({
    StatisticsStatus? status,
    List<Statistics>? stats,
  }) {
    return StatisticsState(
      status: status ?? this.status,
      stats: stats ?? this.stats,
    );
  }

  @override
  List<Object> get props => [status, stats];
}
