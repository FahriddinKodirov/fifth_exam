import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:exam_five/bloc/connectivity/connectivity_state.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ConnectivityCubit extends Cubit<ConnectivityState> {
   final Connectivity _connectivity = Connectivity();

  ConnectivityCubit():super(
      const ConnectivityState(connectivityResult: ConnectivityResult.mobile)) {
    checkInternet();
  }

  

  checkInternet() {
    initConnectivity();
    _connectivity.onConnectivityChanged.listen((event) {
      emit(state.copyWith(connectivityResult: event));
    });
  }

  Future<void> initConnectivity() async {
    ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException {
      return;
    }
    emit(state.copyWith(connectivityResult: result));
  }
}
