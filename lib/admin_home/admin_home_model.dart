import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AdminHomeModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool? statusType;

  List<String> usersId = [];
  void addToUsersId(String item) => usersId.add(item);
  void removeFromUsersId(String item) => usersId.remove(item);
  void removeAtIndexFromUsersId(int index) => usersId.removeAt(index);
  void updateUsersIdAtIndex(int index, Function(String) updateFn) =>
      usersId[index] = updateFn(usersId[index]);

  bool checkHead = false;

  List<String> submittedUsers = [];
  void addToSubmittedUsers(String item) => submittedUsers.add(item);
  void removeFromSubmittedUsers(String item) => submittedUsers.remove(item);
  void removeAtIndexFromSubmittedUsers(int index) =>
      submittedUsers.removeAt(index);
  void updateSubmittedUsersAtIndex(int index, Function(String) updateFn) =>
      submittedUsers[index] = updateFn(submittedUsers[index]);

  String tempPass = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for inputinvitemail widget.
  TextEditingController? inputinvitemailController;
  String? Function(BuildContext, String?)? inputinvitemailControllerValidator;
  // State field(s) for DropDownStatus widget.
  String? dropDownStatusValue;
  FormFieldController<String>? dropDownStatusValueController;
  // State field(s) for DropDownUsers widget.
  List<String>? dropDownUsersValue;
  FormFieldController<String>? dropDownUsersValueController;
  // Stores action output result for [Backend Call - API (send notification)] action in Button widget.
  ApiCallResponse? apiResultNotify;
  // State field(s) for Checkboxhead widget.
  bool? checkboxheadValue;
  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  // State field(s) for Checkbox widget.

  Map<UsersRecord, bool> checkboxValueMap = {};
  List<UsersRecord> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // Stores action output result for [Backend Call - API (notify single)] action in Button widget.
  ApiCallResponse? apiResultNotifysingle;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    inputinvitemailController?.dispose();
    textController1?.dispose();
    textController2?.dispose();
    textController3?.dispose();
    textController4?.dispose();
    textController5?.dispose();
    textController6?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
