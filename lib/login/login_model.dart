import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  int? otpGen;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for inputEmail widget.
  TextEditingController? inputEmailController;
  String? Function(BuildContext, String?)? inputEmailControllerValidator;
  // Stores action output result for [Custom Action - checkIfEmailExists] action in Button widget.
  bool? emailChecked;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    inputEmailController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
