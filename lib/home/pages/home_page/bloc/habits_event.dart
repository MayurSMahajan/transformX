part of 'habits_bloc.dart';

sealed class HabitsEvent extends Equatable {
  const HabitsEvent();

  @override
  List<Object> get props => [];
}

final class HabitsSubscriptionRequested extends HabitsEvent {
  const HabitsSubscriptionRequested();
}
