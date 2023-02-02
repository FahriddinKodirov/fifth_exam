import 'package:exam_five/data/model/companies_model/customer_model.dart';

abstract class CustomerState {}

class InitialCustomerState extends CustomerState {}

class LoadCustomerInProgress extends CustomerState {}

class LoadCustomerInSuccess extends CustomerState {
  final CustomerModel customerModel;

  LoadCustomerInSuccess({required this.customerModel});
}

class LoadCustomerInFailure extends CustomerState {
  final String errorText;

  LoadCustomerInFailure({required this.errorText});
}