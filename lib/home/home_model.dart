import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  int? looooop = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - readSmsPermission] action in Home widget.
  bool? permissionResLoad;
  // Stores action output result for [Custom Action - readMessagesCopy] action in Home widget.
  List<dynamic>? readmessagesLoad;
  // Stores action output result for [Custom Action - unixTimestampToDateAndTime] action in Home widget.
  DateTime? transTimeCopy;
  // Stores action output result for [Custom Action - readSmsPermission] action in Button widget.
  bool? permissionRes;
  // Stores action output result for [Custom Action - readMessages] action in Button widget.
  List<dynamic>? readMessages;
  // Stores action output result for [Custom Action - unixTimestampToDateAndTime] action in Button widget.
  DateTime? transTime;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
