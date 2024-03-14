import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hopewell/common/values/constants.dart';
import 'package:hopewell/common/widgets/flutter_toast.dart';
import 'package:hopewell/pages/global.dart';
import 'package:hopewell/pages/sign_in/bloc/sign_in_bloc.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  void handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        String email = state.email;
        String password = state.password;
        if (email.isEmpty) {
          toastInfo(msg: "Email is empty");
          return;
        }
        if (password.isEmpty) {
          toastInfo(msg: "Password is empty");
          return;
        }
        // Network issues
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password);
          if (credential.user == null) {
            toastInfo(msg: "User does not exist");
            return;
          }
          if (!credential.user!.emailVerified) {
            toastInfo(msg: "Verify the account first");
            return;
          }

          var user = credential.user;
          if (user != null) {
            // the user is verified
            print(user);
            String? displayName = user.displayName;
            String? email = user.email;
            String? id = user.uid;
            String? photoUrl = user.photoURL;
            print('my url is $photoUrl');
            EasyLoading.show(
              indicator: CircularProgressIndicator(),
              maskType: EasyLoadingMaskType.clear,
              dismissOnTap: true,
            );
            Map<String, dynamic> userData = {};
            userData['display_name'] = user.displayName;
            userData['email'] = user.email;
            userData['id'] = user.uid;
            userData['photoUrl'] = user.photoURL;
            try {
              Global.storageService.setString(
                  AppConstants.STORAGE_USER_PROFILE_KEY, jsonEncode(userData));
              Global.storageService
                  .setString(AppConstants.STORAGE_USER_TOKEN_KEY, user.uid);
              EasyLoading.dismiss();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("/application", (route) => false);
            } catch (e) {
              print("saving local storage error ${e.toString()}");
            }

            // Navigator.of(context)
            //     .pushNamedAndRemoveUntil("/application", (route) => false);
          } else {
            // error getting user
            toastInfo(msg: "No user for this app");
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            print('no user found for this email');
            toastInfo(msg: "No user for this email");
          } else if (e.code == 'wrong-password') {
            print('wrong password for this user');
            toastInfo(msg: "Wrong password for this user");
          } else if (e.code == 'invalid-email') {
            print('your email format is wrong');
            toastInfo(msg: "Your email format is wrong");
          }
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
