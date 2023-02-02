import 'package:exam_five/bloc/a/single_satate.dart';
import 'package:exam_five/bloc/a/single_state_cubit.dart';
import 'package:exam_five/data/model/companies_model/customer_satellites.dart';
import 'package:exam_five/data/model/status/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AaPage extends StatelessWidget {
  const AaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AAA Page'),
      ),
      body: BlocBuilder<SingleStateCubit, SingleState>(
        builder: (context, state) {
          if (state.status == Status.ERROR) {
            return Center(child: Text(state.error.toString()));
          }
          if (state.status == Status.SUCCESS) {
            return ListView.builder(
              itemCount: state.customerModel!.customerSatellites.length,
              itemBuilder: (context, index) {
                CustomerSatellites customer =
                    state.customerModel!.customerSatellites[index];
                return ListTile(
                  title: Text(customer.country),
                  subtitle: Text(customer.id),
                  trailing: Column(
                    children: [
                      Text(customer.launcher),
                      Text(customer.launchDate),
                    ],
                  ),
                );
              },
            );
          }
          if (state.status == Status.LOADING) {
            return const Center(child: CircularProgressIndicator());
          }
          return const SizedBox();
        },
      ),
     
    );
  }
}
