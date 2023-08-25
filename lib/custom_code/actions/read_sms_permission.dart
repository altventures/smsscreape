// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';

Future<bool> readSmsPermission() async {
  var permission = await Permission.sms.status;
  if (permission.isGranted) {
//          sendToBubble(Message.message);

    print("Message");
    return false;
  } else {
    await Permission.sms.request();
    return true;
  }
  // Add your function code here!
}
