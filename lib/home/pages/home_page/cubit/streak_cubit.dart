import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'streak_state.dart';

class StreakCubit extends Cubit<StreakState> {
  StreakCubit() : super(StreakInitial());
}
