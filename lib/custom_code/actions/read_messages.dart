// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions

import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';

Future<List<dynamic>> readMessages(LogsRecord? lastLog) async {
  SmsQuery query = SmsQuery();
  final messages = await query.querySms(
    kinds: [
      SmsQueryKind.inbox,
      SmsQueryKind.sent,
    ],
    address: '8326',
  );
  print(messages.runtimeType);

  // Filter the messages to only include transaction messages
  final transactionMessages = messages.where((message) {
    final body = message.body;
    return body!.contains('your A/C No.') == true &&
        body!.contains('has been debited by') == true;
  }).toList();

  List<Map<String, dynamic>> messagesJson = transactionMessages.map((message) {
    // Extract the transaction amount from the message body
    final amountRegex = RegExp(r'PKR ([\d\\.]+)');
    final amountMatch = amountRegex.firstMatch(message.body ?? '');
    final amount = amountMatch != null
        ? double.tryParse(amountMatch.group(1) ?? '')
        : null;
    final date = message.date;
    final unixTimestamp = (date!.millisecondsSinceEpoch / 1000).round();

    return {
      'body': message.body,
      'address': message.address,
      'date': message.date,
      'dateSent': message.dateSent,
      'id': message.id,
      'amount': amount,
      'unixTime': unixTimestamp
    };
  }).toList();

  if (lastLog != null) {
    // Convert the lastRecordTime to a Unix timestamp in seconds
    final lastRecordTime =
        (lastLog.lastRecordTime!.millisecondsSinceEpoch / 1000).round();

    // Filter the messages to only include new messages
    messagesJson = messagesJson.where((message) {
      return message['unixTime'] > lastRecordTime;
    }).toList();
  }

  return messagesJson;
}
