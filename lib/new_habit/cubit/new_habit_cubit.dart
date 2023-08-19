import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'new_habit_state.dart';

class NewHabitCubit extends Cubit<NewHabitState> {
  NewHabitCubit() : super(const NewHabitState());

  void setStatus(NewHabitStatus status) {
    emit(NewHabitState(
      status: status,
    ));
  }
}
