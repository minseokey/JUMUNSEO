import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/physics.dart';

part 'dilemma_chat_state.dart';

class DilemmaChatCubit extends Cubit<DilemmaChatState> {
  DilemmaChatCubit() : super(DilemmaChatState());
}
