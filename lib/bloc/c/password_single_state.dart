import 'package:equatable/equatable.dart';

class PasswordSingleState extends Equatable {
  bool? loginNumber;

  PasswordSingleState({
     this.loginNumber,
  });

  PasswordSingleState copyWith({
    bool? loginNumber,
  }) {
    return PasswordSingleState(
        loginNumber: loginNumber ?? this.loginNumber,
        );
  }

  @override
  List<Object?> get props => [loginNumber];
}





// abstract class PasswordSingleState {}


// class InitialCompaniesState extends PasswordSingleState {}

// class LoadPasswordInSuccess extends PasswordSingleState {
//   final bool loginNumber;
 
//   LoadPasswordInSuccess({required this.loginNumber});
// }