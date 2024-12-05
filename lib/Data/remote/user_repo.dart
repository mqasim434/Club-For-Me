import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository{
  Future<bool> updateUserFields(String userId, Map<String, dynamic> updates) async {
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

}