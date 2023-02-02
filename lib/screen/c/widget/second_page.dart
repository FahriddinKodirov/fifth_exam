import 'package:exam_five/bloc/c/password_single_bloc.dart';
import 'package:exam_five/bloc/c/password_single_event.dart';
import 'package:exam_five/bloc/c/password_single_state.dart';
import 'package:exam_five/screen/c/first_page.dart';
import 'package:exam_five/screen/tab/tab_bar_page.dart';
import 'package:exam_five/utils/my_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      leading: null,  
      title: const Text('Second page'),),
      body: BlocBuilder<PasswordStateBloc,PasswordSingleState>(
        builder: (context, state) {
          if(state is PasswordSingleState)
          // ignore: curly_braces_in_flow_control_structures
          return SizedBox(
            height: height(context),
            width: width(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                TextButton(onPressed: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> const TabBarPage()));
                  BlocProvider.of<PasswordStateBloc>(context)..add(FetchPassword(numberTwo: '', numberOne: ''));
                }, child: const Text('Restart',style: TextStyle(fontSize: 50),))
              
              ],
            ),
          );
          return const SizedBox();
        })

    );
  }
}