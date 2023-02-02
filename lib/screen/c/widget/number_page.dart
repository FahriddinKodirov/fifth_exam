// import 'dart:ffi';

// import 'package:exam_five/bloc/c/password_single_bloc.dart';
// import 'package:exam_five/bloc/c/password_single_state.dart';
// import 'package:exam_five/screen/c/first_page.dart';
// import 'package:exam_five/screen/c/widget/second_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class CcPage extends StatefulWidget {
//   const CcPage({super.key});

//   @override
//   State<CcPage> createState() => _CcPageState();
// }

// class _CcPageState extends State<CcPage> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<PasswordSingleBloc, PasswordSingleState>(
//             builder: (context, state) {
//               if (state is LoadPasswordInSuccess) {
//                 if (state.loginNumber == true) {
//                   Navigator.pushReplacement(context,
//                       MaterialPageRoute(builder: (context) =>const SecondPage()));
//                 } else if (state.loginNumber == false)  {
//                 Navigator.pushReplacement(context,
//                       MaterialPageRoute(builder: (context) =>const FirstPage()));
//               }
//               } 
//             return Container(color: Colors.amber,);
//             },
            
    
//     );
//   }
// }