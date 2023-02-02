import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

class ConnectivityState extends Equatable {
 final ConnectivityResult connectivityResult;
 
  const ConnectivityState({required this.connectivityResult});

  

  ConnectivityState copyWith({ConnectivityResult? connectivityResult}) =>
      ConnectivityState(
          connectivityResult: connectivityResult ?? this.connectivityResult);

  @override
  List<Object?> get props => [connectivityResult];
}