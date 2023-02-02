import 'package:exam_five/bloc/b/customer.dart';
import 'package:exam_five/bloc/b/customer_state.dart';
import 'package:exam_five/data/api/api_service.dart';
import 'package:exam_five/data/model/companies_model/customer_satellites.dart';
import 'package:exam_five/data/repositories/b/customer_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BbPage extends StatelessWidget {
  const BbPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CustomerCubit(CustomerRepo(apiService: ApiService())),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BBB Page'),
        ),
        body: BlocBuilder<CustomerCubit, CustomerState>(
          builder: (context, state) {
            if (state is InitialCustomerState) {
              return const Text('data yoq', style: TextStyle(fontSize: 24));
            } else if (state is LoadCustomerInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LoadCustomerInSuccess) {
              return ListView.builder(
                itemCount: state.customerModel.customerSatellites.length,
                itemBuilder: (context, index){
                  CustomerSatellites customer = state.customerModel.customerSatellites[index];
                  return ListTile(
                    title:
                        Text(customer.country),
                    subtitle: Text(
                        customer.id),
                    trailing: Column(
                      children: [
                        Text(
                            customer.launcher),
                        Text(
                            customer.launchDate),
                      ],
                    ),
                   
                      
                  );
                },
              );
            } else if (state is LoadCustomerInFailure) {
              return Center(child: Text(state.errorText));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}