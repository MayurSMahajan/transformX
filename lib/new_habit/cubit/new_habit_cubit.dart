import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum NewHabitStatus {
  initial,
  quarter,
  half,
  quarterAndHalf,
  complete,
}

@immutable
class NewHabitState extends Equatable {
  const NewHabitState({
    this.status = NewHabitStatus.initial,
    this.progress = 0.0,
  });

  final NewHabitStatus status;
  final double progress;

  @override
  List<Object> get props => [status, progress];
}

class NewHabitCubit extends Cubit<NewHabitState> {
  NewHabitCubit() : super(const NewHabitState());

  void setStatusAndProgress(NewHabitStatus status, double progress) {
    emit(
      NewHabitState(status: status, progress: progress),
    );
  }
}
