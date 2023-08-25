// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';

Future<List<dynamic>> readMessages() async {
  // Add your function code here!
  SmsQuery query = SmsQuery();
  final messages = await query.querySms(
    kinds: [
      SmsQueryKind.inbox,
      SmsQueryKind.sent,
    ],
    address: '8326',
  );
  print(messages.runtimeType);

  List<Map<String, dynamic>> messagesJson = messages.map((message) {
    return {
      'body': message.body,
      'address': message.address,
      'date': message.date,
      'dateSent': message.dateSent,
      'id': message.id
    };
  }).toList();

  return messagesJson;
}
