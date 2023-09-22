part of 'single_streak_cubit.dart';

enum SingleStreakStatus {
  initial,
  loading,
  success,
  failure,
}

final class SingleStreakState extends Equatable {
  const SingleStreakState({
    this.status = SingleStreakStatus.initial,
    this.count = 0,
  });

  final SingleStreakStatus status;
  final int count;

  SingleStreakState copyWith({
    SingleStreakStatus? status,
    int? count,
  }) {
    return SingleStreakState(
      status: status ?? this.status,
      count: count ?? this.count,
    );
  }

  @override
  List<Object> get props => [status, count];
}
