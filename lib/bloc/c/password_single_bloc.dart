
import 'package:exam_five/bloc/c/password_single_event.dart';
import 'package:exam_five/bloc/c/password_single_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordStateBloc extends Bloc<PasswordSingleEvent, PasswordSingleState> {
  PasswordStateBloc() : super(PasswordSingleState()) {
    on<FetchPassword>(_fetchPassword);
  }

  _fetchPassword(FetchPassword event, Emitter<PasswordSingleState> emit) async {
      
      emit(state.copyWith(loginNumber:false));
    if(event.numberOne.length > 2){
      if(event.numberOne == event.numberTwo) {
      emit(state.copyWith(loginNumber:true));
    }
    }
  
  }
}






