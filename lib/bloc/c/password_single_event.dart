abstract class PasswordSingleEvent {}

class FetchPassword extends PasswordSingleEvent {
  final String numberOne;
  final String numberTwo;

  FetchPassword({required this.numberTwo, required this.numberOne, });
  
}
