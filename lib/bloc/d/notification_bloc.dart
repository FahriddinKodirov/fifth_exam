import 'package:exam_five/bloc/c/password_single_event.dart';
import 'package:exam_five/bloc/c/password_single_state.dart';
import 'package:exam_five/bloc/d/notification_event.dart';
import 'package:exam_five/bloc/d/notification_state.dart';
import 'package:exam_five/data/model/user/user_model.dart';
import 'package:exam_five/data/repositories/d/ueer_repo.dart';
import 'package:exam_five/utils/storageService/storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UsersRepository usersRepository;

 UserBloc(this.usersRepository): super((InitialUserState())) {
    on<FetchUser>(listenUsers);
  }


  

  Stream<List<UserModel>>? listenUsers(FetchUser event,Emitter<UserState> emit) {
  
  List<UserModel> userModel = usersRepository.getUsers();
  emit(LoadUserdInSuccess(notification: userModel));
  

  }

 deleteUser(String docId) =>
      usersRepository.deleteUser(docId: docId);
}

