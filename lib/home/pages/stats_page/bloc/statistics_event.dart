part of 'statistics_bloc.dart';

sealed class StatisticsEvent extends Equatable {
  const StatisticsEvent();

  @override
  List<Object> get props => [];
}

class StatisticsRequestedEvent extends StatisticsEvent {
  const StatisticsRequestedEvent();
}
