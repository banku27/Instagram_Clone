import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/resources/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //sign up user method
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "some error occured";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty) {
        //register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        print("User Uid ()()():::::::::::::>" + cred.user!.uid);

        String photoUrl = await StorageMethods()
            .uploadImageToStorage('Profilepic', file, false);

        await _firestore.collection('user').doc(cred.user!.uid).set({
          'username': username,
          'uid': cred.user!.uid,
          'email': email,
          'bio': bio,
          'followers': [],
          'following': [],
          'photoUrl': photoUrl,
        });

        res = "success";
        print("User Info ()()()::::::::::::::> " +
            username +
            cred.user!.uid +
            email +
            bio);
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == 'invalid-email') {
        res = 'The email is badly formatted.';
      } else if (err.code == 'weak password') {
        res = "Password should atleast be 6 characters";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}

// Future<String> loginUser(
//     {required String email, required String password}) async {
//   String res = "some error occured";

//   try {
//     if (email.isNotEmpty || password.isNotEmpty) {
//       await _auth.signInWithEmailAndPassword(email: email, password: password);
//       res = "success";
//     } else {
//       res = "Please enter all the fields";
//     }
//   } catch (err) {
//     res = err.toString();
//   }
// }
