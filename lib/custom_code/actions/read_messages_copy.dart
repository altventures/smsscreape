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

Future<List<dynamic>> readMessagesCopy(int timestamp) async {
  SmsQuery query = SmsQuery();
  final messages = await query.querySms(
    kinds: [
      SmsQueryKind.inbox,
    ],
  );

  // Filter the messages to only include transaction messages
  final transactionMessages = messages.where((message) {
    final body = message.body;
    return body!.contains('Your Fund Transfer transaction amounting to') ==
            true &&
        body.contains('is successful.') == true;
  }).toList();

  List<Map<String, dynamic>> messagesJson = transactionMessages.map((message) {
    // Extract the transaction amount from the message body
    final amountRegex = RegExp(r'PHP ([\d\.,]+)');
    final amountMatch = amountRegex.firstMatch(message.body ?? '');
    final amount = amountMatch != null
        ? double.tryParse(amountMatch.group(1)!.replaceAll(',', ''))
        : null;

    // Extract the date from the message body
    final dateRegex =
        RegExp(r'(\d{2}-[A-Za-z]{3}-\d{4} \d{2}:\d{2}:\d{2} [APM]{2})');
    final dateMatch = dateRegex.firstMatch(message.body ?? '');
    final extractedDate =
        dateMatch != null ? dateMatch.group(1) : message.date.toString();

    final unixTimestamp = (message.date!.millisecondsSinceEpoch / 1000).round();
    return {
      'body': message.body,
      'address': message.address,
      'date':
          extractedDate, // The extracted date or the original date if extraction fails
      'dateSent': message.dateSent,
      'id': message.id,
      'amount': amount,
      'unixTime': unixTimestamp
    };
  }).toList();

  // Filter the messages to only include new messages
  messagesJson = messagesJson.where((message) {
    return message['unixTime'] > timestamp;
  }).toList();

  return messagesJson;
}
