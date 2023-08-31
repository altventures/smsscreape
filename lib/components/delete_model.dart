import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DeleteModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  bool showRedText = true;

  ///  State fields for stateful widgets in this component.

  // State field(s) for inputDelEmail widget.
  TextEditingController? inputDelEmailController;
  String? Function(BuildContext, String?)? inputDelEmailControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    inputDelEmailController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
