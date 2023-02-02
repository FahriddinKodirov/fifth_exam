import 'package:dio/dio.dart';
import 'package:exam_five/data/model/companies_model/customer_model.dart';
import 'package:exam_five/data/model/my_respon/my_response.dart';

import 'api_client.dart';

class ApiService extends ApiClient {
  
// ---------------- BBB ------------------
  Future<MyResponse> getCustomer() async {
    MyResponse myResponse = MyResponse(error: "");
    
    try {
      Response response = await dio.get("${dio.options.baseUrl}/customer_satellites");
      if (response.statusCode == 200) {
        myResponse.data = CustomerModel.fromJson(response.data);
      }
    } catch (err) {
      myResponse.error = err.toString();
    }

    return myResponse;
  }
 
//  --------------------- AAAA ----------------------

  Future<MyResponse> getCustomerDate() async {
    MyResponse myResponse = MyResponse(error: "");
    
    try {
      Response response = await dio.get("${dio.options.baseUrl}/customer_satellites");
      if (response.statusCode == 200) {
        myResponse.data = CustomerModel.fromJson(response.data);
      }
    } catch (err) {
      myResponse.error = err.toString();
    }

    return myResponse;
  }
 

 
}