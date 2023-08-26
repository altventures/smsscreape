// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<DateTime> unixTimestampToDateAndTime(int unixTime) async {
  // Add your function code here!
  int timestamp = unixTime;
  var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  print(date);
  return date;
}
