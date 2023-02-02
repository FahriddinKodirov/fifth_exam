import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exam_five/data/model/user/user_model.dart';
import 'package:exam_five/utils/my_utils.dart';

class UsersRepository {
  final FirebaseFirestore _firestore;

  UsersRepository({required FirebaseFirestore firebaseFirestore}):
    _firestore = firebaseFirestore;

  Future<void>deleteUser({required String docId}) async {
    try {
      await _firestore.collection('users').doc(docId).delete();
      getMyToast(message: "User muvaffaqiyatli o'chirildi!");
    } on FirebaseException catch (er) {
      getMyToast(message: er.message.toString());
   }
  }
   
   getUsers() =>
     _firestore.collection('users').snapshots().map((event) => event
      .docs.map((doc) => UserModel.fromJson(doc.data())).toList());
}