import 'package:exam_five/data/api/api_service.dart';
import 'package:exam_five/data/model/my_respon/my_response.dart';
import 'package:exam_five/utils/get_it/get_it.dart';

class CustomDataRepo {

  Future<MyResponse> getCustomerDate() => getIt<ApiService>().getCustomerDate();
}