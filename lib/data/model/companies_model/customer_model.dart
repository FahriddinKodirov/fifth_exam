import 'package:exam_five/data/model/companies_model/customer_satellites.dart';

class CustomerModel {
  List<CustomerSatellites> customerSatellites;

  CustomerModel({
    required this.customerSatellites,
  });

factory CustomerModel.fromJson(Map<String, dynamic> jsonData){
  return CustomerModel(
    customerSatellites: (jsonData['customer_satellites'] as List).map((json) => CustomerSatellites.fromJson(json)).toList());
}
}