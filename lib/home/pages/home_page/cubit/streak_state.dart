part of 'streak_cubit.dart';

enum StreakStatus {
  initial,
  loading,
  success,
  failure,
}

final class StreakState extends Equatable {
  const StreakState({
    this.status = StreakStatus.initial,
    this.streakList = const [],
  });

  final StreakStatus status;
  final List<bool> streakList;

  StreakState copyWith({
    StreakStatus? status,
    List<bool>? streakList,
  }) {
    return StreakState(
      status: status ?? this.status,
      streakList: streakList ?? this.streakList,
    );
  }

  @override
  List<Object> get props => [status, streakList];
}
