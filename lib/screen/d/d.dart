import 'package:exam_five/bloc/d/notification_bloc.dart';
import 'package:exam_five/bloc/d/notification_state.dart';
import 'package:exam_five/data/model/user/user_model.dart';
import 'package:exam_five/data/repositories/d/notification/notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AllUsersScreen extends StatefulWidget {
  const AllUsersScreen({Key? key}) : super(key: key);

  @override
  State<AllUsersScreen> createState() => _AllUsersScreenState();
}

class _AllUsersScreenState extends State<AllUsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
        actions: [
          IconButton(onPressed: ()async {
            String messageId = 
                 await NotificationApiService.sendNotificationToAll('users');
                print("NOTIF SUCESS:$messageId"); 
          }, icon: Icon(Icons.notification_add)),
        ],
      ),
       body: BlocBuilder<UserBloc,UserState>(
        builder: (context, state) {
          if(state is LoadUserdInSuccess){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(state is LoadUserdInSuccess){
            List<UserModel> users = state.notification;
            return ListView(
              children: List.generate(users.length, (index) {
                UserModel user = users[index];
                return ListTile(
                  title: Text(user.email),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () async {
                              String message = "";
                              await _showDialog((value) {
                                message = value;
                              });
    
                              int sendSuccess = await NotificationApiService
                                  .sendNotificationToUser(
                                fcmToken: user.fcmToken,
                                message: message,
                              );
                              print("NOTIF SUCESS:$sendSuccess");
                            },
                            icon: const Icon(Icons.notification_add)),
                      ],
                    ),
                  ),
                );
              }),
            );
          } else {
            return Center(
              child: Text(''),
            );
          }
        },
      ),
    );
  }
          
  

  Future<void> _showDialog(ValueChanged<String> message) async {
    final TextEditingController controller = TextEditingController();
    await showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
                height: 200,
                child: Column(
                  children: [
                    TextField(
                      controller: controller,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          message.call(controller.text);
                          Navigator.pop(context);
                        },
                        child: Text("Send")),
                  ],
                )),
          );
        });
  }

}