import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:exam_five/bloc/connectivity/connectivity_cubit.dart';
import 'package:exam_five/bloc/connectivity/connectivity_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoInternetPage extends StatelessWidget {
  final VoidCallback voidCallback;

  const NoInternetPage({super.key, required this.voidCallback});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: BlocListener<ConnectivityCubit, ConnectivityState>(
        listener: (context, state) {
          if (state.connectivityResult != ConnectivityResult.none) {
            voidCallback.call();
            Navigator.pop(context);
          }
        },
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.asset(
                      "assets/images/int.png",
                      fit: BoxFit.cover,
                    )),
              ),
              const SizedBox(height: 50,),
              const Text("Internetingizni yoqing!",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
            ],
          ),
        ),
      ),
    );
  }
}

  