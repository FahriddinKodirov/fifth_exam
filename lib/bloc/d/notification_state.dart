import 'package:exam_five/data/model/user/user_model.dart';

abstract class UserState {}


class InitialUserState extends UserState {}

class LoadUserdInSuccess extends UserState {
  final List<UserModel> notification;
 
  LoadUserdInSuccess({required this.notification});
}