// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
Future<bool> checkIfEmailExists(String email) async {
  try {
    final list = await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
    if (list.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  } catch (error) {
    // Handle error
    return true;
  }
}
