import 'package:exam_five/bloc/a/single_satate.dart';
import 'package:exam_five/data/model/my_respon/my_response.dart';
import 'package:exam_five/data/model/status/status.dart';
import 'package:exam_five/data/repositories/a/custom_data_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SingleStateCubit extends Cubit<SingleState> {
  SingleStateCubit({required this.customDataRepo}) : super(SingleState()){
    getCustomData();
  }

  CustomDataRepo customDataRepo;

  getCustomData() async {
    emit(SingleState(status: Status.LOADING));

    MyResponse myResponse = await customDataRepo.getCustomerDate();
    if (myResponse.error == '') {
      emit(state.copyWith(customerModel: myResponse.data, status: Status.SUCCESS));
    } else {
      emit(state.copyWith(error: myResponse.error, status: Status.ERROR));
    }
  }
}