import 'package:exam_five/bloc/b/customer_state.dart';
import 'package:exam_five/data/model/my_respon/my_response.dart';
import 'package:exam_five/data/repositories/b/customer_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerCubit extends Cubit<CustomerState> {
  final CustomerRepo customerRepo;

  CustomerCubit(this.customerRepo):super(InitialCustomerState()){
    fetchCutomer();
  }

fetchCutomer() async {
    emit(LoadCustomerInProgress());
    MyResponse myResponse = await customerRepo.getCustomer();
    if (myResponse.error.isEmpty) {
      emit(LoadCustomerInSuccess(customerModel: myResponse.data));
    } else {
      emit(LoadCustomerInFailure(errorText: myResponse.error));
    }
  }

}