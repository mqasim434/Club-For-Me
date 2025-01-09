import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:club_for_me/Features/Dashboard/profile/model/user_model.dart';

class UserRepository {
  Future<bool> updateUserFields(
      String userId, Map<String, dynamic> updates) async {
    try {
      // Assuming you're using Firebase Firestore
      await FirebaseFirestore.instance
          .collection('users') // Replace with your user collection name
          .doc(userId)
          .update(updates);

      return true;
    } catch (e) {
      print('Error updating user fields: ${e.toString()}');
      return false;
    }
  }

  Future<UserModel?> getUserById(String uid) async{
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore.collection('users').where('id', isEqualTo: uid).get();

      return UserModel.fromMap(querySnapshot.docs.first.data());
    } catch (e) {
      return null;
    }
  }
}
