import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:club_for_me/Features/Authentication/signin/view/siginin_screen.dart';
import 'package:club_for_me/Features/Dashboard/profile/model/user_model.dart';
import 'package:club_for_me/Utils/errors/exceptions/firebase_auth_exceptions.dart';
import 'package:club_for_me/Utils/errors/exceptions/firebase_exceptions.dart';
import 'package:club_for_me/Utils/errors/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> createUserAccount(
      String email, String password, String phone) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      String uid = userCredential.user!.uid;

      final time = DateTime.now().millisecondsSinceEpoch.toString();
      final adminData = UserModel(
        id: uid,
        username: '',
        email: email,
        password: password,
        createdAt: time,
        lastActive: time,
        city: '',
        language: '',
        favouriteEvent: '',
        musicGenre: '',
        status: 'active',
        profilePic: '',
        gender: '',
        phoneNumber: phone,
        dateOfBirth: '',
      );

      await _firestore.collection('users').doc(uid).set(adminData.toMap());

      return 'Success';
    } catch (e) {
      return handleException(e);
    }
  }

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'Success';
    } catch (e) {
      return handleException(e);
    }
  }

  Future<String?> resetPassword({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return 'An email has been sent to reset the password';
    } catch (e) {
      return handleException(e);
    }
  }

  void signOutWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(10),
      title: 'Sign out',
      middleText: 'Are you sure you want to sign out of your account?',
      confirm: ElevatedButton(
        onPressed: () async => await logout(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: const BorderSide(color: Colors.red),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'Sign out',
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ),
      cancel: OutlinedButton(
        child: const Text('Cancel'),
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
      ),
    );
  }

  Future<bool> checkUserRole(
      {required String email, required String role}) async {
    var user = await _firestore
        .collection('users')
        .where('email', isEqualTo: email)
        .where('role', isEqualTo: role)
        .get();

    return user.docs.isNotEmpty;
  }

  Future<String?> logout() async {
    try {
      await _firebaseAuth.signOut();
      Get.offAll(() => const SigininScreen());
      return 'Logged out successfully';
    } catch (e) {
      return handleException(e);
    }
  }

  String? handleException(Object e) {
    if (e is FirebaseAuthException) {
      return EFirebaseAuthException(e.code).message;
    } else if (e is FirebaseException) {
      return EFirebaseException(e.code).message;
    } else if (e is PlatformException) {
      return EPlatformException(e.code).message;
    } else {
      return 'Something went wrong. Please try again later.';
    }
  }

  Future<void> handleGoogleSignIn() async {
    try {
      // Initialize Google Sign-In
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        print("Google Sign-In aborted by user");
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Authenticate with Firebase
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Get the authenticated user
      final User? user = userCredential.user;

      print('User ${user}');

      if (user != null) {
        // Get Firestore reference
        final CollectionReference usersRef =
            FirebaseFirestore.instance.collection('users');

        // Check if the user exists in Firestore
        DocumentSnapshot userDoc = await usersRef.doc(user.uid).get();

        // Prepare user data
        final userData = {
          "name": user.displayName,
          "email": user.email,
          "photoURL": user.photoURL,
          "lastSignIn": FieldValue.serverTimestamp(),
        };

        if (userDoc.exists) {
          // Update the existing user's data
          await usersRef.doc(user.uid).update(userData);
          print("User data updated: ${user.email}");
        } else {
          // Add a new user to the database
          await usersRef.doc(user.uid).set(userData);
          print("New user added: ${user.email}");
        }
      } else {
        print("Error: No user found after Google Sign-In");
      }
    } catch (error) {
      print("Error during Google Sign-In: $error");
    }
  }
}
