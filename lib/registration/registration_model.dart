import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegistrationModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for InputdisplayName widget.
  TextEditingController? inputdisplayNameController;
  String? Function(BuildContext, String?)? inputdisplayNameControllerValidator;
  // State field(s) for DropDownState widget.
  String? dropDownStateValue;
  FormFieldController<String>? dropDownStateValueController;
  // State field(s) for DropDownCity widget.
  String? dropDownCityValue;
  FormFieldController<String>? dropDownCityValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    inputdisplayNameController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
