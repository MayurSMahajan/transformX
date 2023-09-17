import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum NewHabitUIStatus {
  initial,
  quarter,
  half,
  quarterAndHalf,
  complete,
}

@immutable
class NewHabitUIState extends Equatable {
  const NewHabitUIState({
    this.status = NewHabitUIStatus.complete,
    this.progress = 0.0,
  });

  //TODO: make the initial status as initial.

  final NewHabitUIStatus status;
  final double progress;

  @override
  List<Object> get props => [status, progress];
}

class NewHabitUICubit extends Cubit<NewHabitUIState> {
  NewHabitUICubit() : super(const NewHabitUIState());

  void setStatusAndProgress(NewHabitUIStatus status, double progress) {
    emit(
      NewHabitUIState(status: status, progress: progress),
    );
  }
}
