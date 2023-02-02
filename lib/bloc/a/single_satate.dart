import 'package:equatable/equatable.dart';
import 'package:exam_five/data/model/companies_model/customer_model.dart';
import 'package:exam_five/data/model/status/status.dart';

class SingleState extends Equatable {
  Status? status;
  String? error;
  CustomerModel? customerModel;

  SingleState({
    this.status,
    this.error,
    this.customerModel,
  });

  SingleState copyWith({
    Status? status,
    String? error,
    CustomerModel? customerModel,
  }) {
    return SingleState(
      status: status ?? this.status,
      error: error ?? this.error,
      customerModel: customerModel ?? this.customerModel,
    );
  }

  @override
  List<Object?> get props => [status, error, customerModel];
}