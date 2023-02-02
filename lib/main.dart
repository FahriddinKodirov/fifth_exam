import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exam_five/bloc/a/single_state_cubit.dart';
import 'package:exam_five/bloc/c/password_single_bloc.dart';
import 'package:exam_five/bloc/d/notification_bloc.dart';
import 'package:exam_five/data/repositories/a/custom_data_repo.dart';
import 'package:exam_five/data/repositories/d/ueer_repo.dart';
import 'package:exam_five/utils/get_it/get_it.dart';
import 'package:exam_five/utils/storageService/storage.dart';
import 'package:exam_five/bloc/connectivity/connectivity_cubit.dart';
import 'package:exam_five/screen/tab/tab_bar_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}


void main() async {
  setup();
  WidgetsFlutterBinding.ensureInitialized();
  StorageService.getInstance();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(
    MultiBlocProvider(providers: [
     BlocProvider(create: (context) => ConnectivityCubit()),
     BlocProvider(create: (context) => PasswordStateBloc()),
     BlocProvider(create: (context) => UserBloc(UsersRepository(firebaseFirestore: FirebaseFirestore.instance))),
     BlocProvider(create: (context) => SingleStateCubit(customDataRepo: CustomDataRepo())),
  ], child: const MyApp()),
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TabBarPage(),
    );
  }
}

