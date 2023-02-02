import 'package:exam_five/data/api/api_service.dart';
import 'package:exam_five/data/model/my_respon/my_response.dart';

class CustomerRepo {
  CustomerRepo({required this.apiService});

  final ApiService apiService;

  Future<MyResponse> getCustomer() =>
      apiService.getCustomer();

}