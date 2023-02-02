import 'package:exam_five/bloc/c/password_single_bloc.dart';
import 'package:exam_five/bloc/c/password_single_event.dart';
import 'package:exam_five/bloc/c/password_single_state.dart';
import 'package:exam_five/screen/c/widget/second_page.dart';
import 'package:exam_five/utils/my_utils.dart';
import 'package:exam_five/utils/storageService/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String saveNumber = '';
  String saveNumberTwo = '';
  bool isTru = false;

  @override
  void initState() {
    super.initState();
    saveNumber = StorageService.getString(" ");
    saveNumberTwo = StorageService.getString(" ");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          backgroundColor: Colors.black,
        ),
        body: BlocListener<PasswordStateBloc, PasswordSingleState>(
            listener: (context, state) {
              // ignore: unnecessary_type_check
              if (state is PasswordSingleState) {
                if (state.loginNumber == true) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SecondPage()));
                }
              }
            },
            child: Container(
              height: height(context),
              width: width(context),
              color: Colors.black,
              child: Column(
                children: [
                  Container(
                    height: height(context) * 0.11,
                    width: width(context) * 0.22,
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(12)),
                    child: const Center(
                        child: Text(
                      'DEV',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                    )),
                  ),
                  SizedBox(
                    height: height(context) * 0.026,
                  ),
                  Text(
                    saveNumber.length == 4 ? 'Tasdiclang' : 'parol kiriting',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(
                    height: height(context) * 0.026,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width(context) * 0.26),
                        child: SizedBox(
                          height: height(context) * 0.08,
                          width: width(context),
                          child: GridView.builder(
                            itemCount: 4,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 24,
                                    crossAxisSpacing: 24,
                                    crossAxisCount: 4),
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                    color: isTru
                                        ? index + 1 <= saveNumberTwo.length
                                            ? Colors.white38
                                            : null
                                        : index + 1 <= saveNumber.length
                                            ? Colors.white38
                                            : null,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.white)),
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width(context) * 0.12),
                        child: SizedBox(
                          height: height(context) * 0.37,
                          width: width(context),
                          child: GridView.builder(
                            itemCount: 9,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 24,
                                    crossAxisSpacing: 24,
                                    crossAxisCount: 3),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    StorageService.saveString(
                                        'accountName', saveNumber);
                                    StorageService.saveString(
                                        'accountName', saveNumberTwo);
                                    BlocProvider.of<PasswordStateBloc>(context)
                                      .add(FetchPassword(
                                          numberOne: saveNumber,
                                          numberTwo: saveNumberTwo));
                                    isTru
                                        ? saveNumberTwo += (index + 1).toString()
                                        : saveNumber += (index + 1).toString();
                                    saveNumber.length == 4 ? isTru = true : false;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.white)),
                                  child: Center(
                                    child: Text(
                                      '${index + 1}',
                                      style: const TextStyle(
                                          fontSize: 26, color: Colors.white),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(left: width(context) * 0.23),
                            child: Container(
                              height: height(context) * 0.096,
                              width: height(context) * 0.096,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white)),
                              child: const Center(
                                child: Text(
                                  '0',
                                  style: TextStyle(
                                      fontSize: 26, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: width(context) * 0.092),
                            child: IconButton(
                                onPressed: () {
                                  isTru ? saveNumberTwo = '' : saveNumber = '';
                                },
                                icon: Icon(
                                  Icons.backspace_rounded,
                                  color: Colors.white,
                                  size: height(context) * 0.05,
                                )),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )));
  }
}
