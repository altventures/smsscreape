// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel/excel.dart';
import 'package:universal_html/html.dart' as html;
import 'dart:io';

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
Future<void> fetchUsersTransacAndExportToExcel(List<String> userIds) async {
  await Firebase.initializeApp();

  final firestore = FirebaseFirestore.instance;
  final usersCollection = firestore.collection('users');

  var excel = Excel.createExcel();
  var sheet = excel['UserDetails'];
  var transactionsSheet = excel['Transactions'];

  final boldStyle = CellStyle(
    bold: true,
  );

  // Add Headers to the users sheet
  sheet.cell(CellIndex.indexByString("A1")).value = 'User ID';
  sheet.updateCell(CellIndex.indexByString("A1"), 'User ID',
      cellStyle: boldStyle);
  sheet.cell(CellIndex.indexByString("B1")).value = 'Name';
  sheet.updateCell(CellIndex.indexByString("B1"), 'Name', cellStyle: boldStyle);
  sheet.cell(CellIndex.indexByString("C1")).value = 'Email';
  sheet.updateCell(CellIndex.indexByString("C1"), 'Email',
      cellStyle: boldStyle);
  sheet.cell(CellIndex.indexByString("D1")).value = 'is_admin';
  sheet.updateCell(CellIndex.indexByString("D1"), 'is_admin',
      cellStyle: boldStyle);
  sheet.cell(CellIndex.indexByString("E1")).value = 'Last Activity';
  sheet.updateCell(CellIndex.indexByString("E1"), 'Last Activity',
      cellStyle: boldStyle);
  sheet.cell(CellIndex.indexByString("F1")).value = 'State';
  sheet.updateCell(CellIndex.indexByString("F1"), 'State',
      cellStyle: boldStyle);
  sheet.cell(CellIndex.indexByString("G1")).value = 'City';
  sheet.updateCell(CellIndex.indexByString("G1"), 'City', cellStyle: boldStyle);
  sheet.cell(CellIndex.indexByString("H1")).value = 'Status';
  sheet.updateCell(CellIndex.indexByString("H1"), 'Status',
      cellStyle: boldStyle);
  sheet.cell(CellIndex.indexByString("I1")).value = 'Date Created';
  sheet.updateCell(CellIndex.indexByString("I1"), 'Date Created',
      cellStyle: boldStyle);
  sheet.cell(CellIndex.indexByString("J1")).value = 'Photo Url';
  sheet.updateCell(CellIndex.indexByString("J1"), 'Photo Url',
      cellStyle: boldStyle);

  // Headers for Transactions sheet
  transactionsSheet.cell(CellIndex.indexByString("A1")).value = 'Email';
  transactionsSheet.cell(CellIndex.indexByString("B1")).value =
      'Transaction Amount';
  transactionsSheet.cell(CellIndex.indexByString("C1")).value =
      'Transaction Date';

  int rowIndex = 1;
  int transactionRowIndex = 1;

  for (String userId in userIds) {
    DocumentSnapshot snapshot = await usersCollection.doc(userId).get();

    if (snapshot.exists) {
      Map<String, dynamic> userDetails =
          snapshot.data() as Map<String, dynamic>;
      // Populate User details Sheet
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: rowIndex))
          .value = userId;
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: rowIndex))
          .value = userDetails['display_name'];
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: rowIndex))
          .value = userDetails['email'];
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: rowIndex))
          .value = (userDetails['is_admin'] == true) ? 'Yes' : 'No';
      // sheet
      //     .cell(CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: rowIndex))
      //     .value = userDetails['last_refreshed'];
      DateTime lastRefreshedDate =
          (userDetails['last_refreshed'] as Timestamp).toDate();
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: rowIndex))
          .value = lastRefreshedDate.toIso8601String();
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 5, rowIndex: rowIndex))
          .value = userDetails['state'];
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 6, rowIndex: rowIndex))
          .value = userDetails['city'];
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 7, rowIndex: rowIndex))
          .value = (userDetails['sms_access'] == true) ? 'Active' : 'Inactive';
      // sheet
      //     .cell(CellIndex.indexByColumnRow(columnIndex: 8, rowIndex: rowIndex))
      //     .value = userDetails['created_time'];
      DateTime createdTimeDate =
          (userDetails['created_time'] as Timestamp).toDate();
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 8, rowIndex: rowIndex))
          .value = createdTimeDate.toIso8601String();
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 9, rowIndex: rowIndex))
          .value = userDetails['photo_url'];

      rowIndex++;

      // Fetch transactions for the user
      QuerySnapshot transactionsSnapshot =
          await usersCollection.doc(userId).collection('transactions').get();
      for (DocumentSnapshot transactionSnapshot in transactionsSnapshot.docs) {
        Map<String, dynamic> transactionData =
            transactionSnapshot.data() as Map<String, dynamic>;

        transactionsSheet
            .cell(CellIndex.indexByColumnRow(
                columnIndex: 0, rowIndex: transactionRowIndex))
            .value = userDetails['email'];
        transactionsSheet
            .cell(CellIndex.indexByColumnRow(
                columnIndex: 1, rowIndex: transactionRowIndex))
            .value = transactionData['amount'];
        DateTime createdTimeDate =
            (transactionData['transac_date'] as Timestamp).toDate();
        transactionsSheet
            .cell(CellIndex.indexByColumnRow(
                columnIndex: 2, rowIndex: transactionRowIndex))
            .value = createdTimeDate.toIso8601String();

        transactionRowIndex++;
      }
    }
  }

  // Save the Excel file
  // final file = File("UserDetails.xlsx");
  // final bytes = excel.encode();
  // if (bytes != null) {
  //   await file.writeAsBytes(bytes);
  //   print("Excel file saved successfully!");
  // } else {
  //   print("Failed to encode Excel data.");
  // }
  Uint8List uint8list = Uint8List.fromList(excel.encode()!);
  final blob = html.Blob([uint8list]);
  final url = html.Url.createObjectUrlFromBlob(blob);
  final anchor = html.AnchorElement(href: url)
    ..target = 'blank'
    ..download = 'User&TransacDetails.xlsx'
    ..click();
  html.Url.revokeObjectUrl(url);
}
