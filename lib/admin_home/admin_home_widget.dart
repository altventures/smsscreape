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
import 'admin_home_model.dart';
export 'admin_home_model.dart';

class AdminHomeWidget extends StatefulWidget {
  const AdminHomeWidget({Key? key}) : super(key: key);

  @override
  _AdminHomeWidgetState createState() => _AdminHomeWidgetState();
}

class _AdminHomeWidgetState extends State<AdminHomeWidget> {
  late AdminHomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminHomeModel());

    _model.inputinvitemailController ??= TextEditingController();
    _model.textController1 ??= TextEditingController(text: 'Name');
    _model.textController2 ??= TextEditingController(text: 'City');
    _model.textController3 ??= TextEditingController(text: 'State');
    _model.textController4 ??= TextEditingController(text: 'Last Activity');
    _model.textController5 ??= TextEditingController(text: 'Status');
    _model.textController6 ??= TextEditingController(text: 'Type');
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xFF7F56D9),
          automaticallyImplyLeading: false,
          title: Text(
            'Poverty Action',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            width: 50.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFF2FDFF),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(0.00, -1.00),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 20.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'User Management',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFF7B61FF),
                                            fontSize: 24.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 200.0,
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            child: Container(
                                              width: 320.0,
                                              child: TextFormField(
                                                controller: _model
                                                    .inputinvitemailController,
                                                autofocus: true,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText:
                                                      'Please enter email here',
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            Color(0xFF667085),
                                                      ),
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0xFFC6D8E0),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  prefixIcon: Icon(
                                                    Icons.mail_outlined,
                                                    color: Color(0xFF667085),
                                                  ),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: Colors.black,
                                                        ),
                                                validator: _model
                                                    .inputinvitemailControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            Function() _navigate = () {};
                                            if (_model.inputinvitemailController
                                                        .text !=
                                                    null &&
                                                _model.inputinvitemailController
                                                        .text !=
                                                    '') {
                                              setState(() {
                                                _model.tempPass =
                                                    random_data.randomString(
                                                  6,
                                                  8,
                                                  true,
                                                  true,
                                                  true,
                                                );
                                              });
                                              GoRouter.of(context)
                                                  .prepareAuthEvent();
                                              if (_model.tempPass !=
                                                  _model.tempPass) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Passwords don\'t match!',
                                                    ),
                                                  ),
                                                );
                                                return;
                                              }

                                              final user = await authManager
                                                  .createAccountWithEmail(
                                                context,
                                                _model.inputinvitemailController
                                                    .text,
                                                _model.tempPass,
                                              );
                                              if (user == null) {
                                                return;
                                              }

                                              await UsersRecord.collection
                                                  .doc(user.uid)
                                                  .update(createUsersRecordData(
                                                    email: _model
                                                        .inputinvitemailController
                                                        .text,
                                                    displayName: _model
                                                        .inputinvitemailController
                                                        .text,
                                                    createdTime:
                                                        getCurrentTimestamp,
                                                    lastRefreshed:
                                                        getCurrentTimestamp,
                                                    isAdmin: true,
                                                    passwords: _model.tempPass,
                                                  ));

                                              _navigate = () =>
                                                  context.goNamedAuth(
                                                      'Home', context.mounted);
                                              await launchUrl(Uri(
                                                  scheme: 'mailto',
                                                  path: _model
                                                      .inputinvitemailController
                                                      .text,
                                                  query: {
                                                    'subject': 'Account Info',
                                                    'body':
                                                        'Here is your temp pass${_model.tempPass}',
                                                  }
                                                      .entries
                                                      .map((MapEntry<String,
                                                                  String>
                                                              e) =>
                                                          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                                      .join('&')));
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text('Error'),
                                                    content: Text(
                                                        'Please enter email address'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('Ok'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            }

                                            _navigate();
                                          },
                                          text: 'Invite admin',
                                          icon: Icon(
                                            Icons.add_circle,
                                            size: 15.0,
                                          ),
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Color(0xFFFF7A00),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color: Colors.white,
                                                    ),
                                            elevation: 3.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FlutterFlowDropDown<String>(
                                      controller: _model
                                              .dropDownStatusValueController ??=
                                          FormFieldController<String>(
                                        _model.dropDownStatusValue ??=
                                            'All Status',
                                      ),
                                      options: [
                                        'All Status',
                                        'Active',
                                        'Inactive'
                                      ],
                                      onChanged: (val) async {
                                        setState(() =>
                                            _model.dropDownStatusValue = val);
                                        if (_model.dropDownStatusValue ==
                                            'All Status') {
                                          setState(() {
                                            _model.statusType = null;
                                          });
                                        } else {
                                          if (_model.dropDownStatusValue ==
                                              'Active') {
                                            setState(() {
                                              _model.statusType = true;
                                            });
                                          } else {
                                            setState(() {
                                              _model.statusType = false;
                                            });
                                          }
                                        }
                                      },
                                      width: 300.0,
                                      height: 50.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Color(0xFF005568),
                                          ),
                                      hintText: 'All Status',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: Colors.white,
                                      elevation: 2.0,
                                      borderColor: Color(0xFFC6D8E0),
                                      borderWidth: 2.0,
                                      borderRadius: 24.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 4.0, 16.0, 4.0),
                                      hidesUnderline: true,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                    StreamBuilder<List<UsersRecord>>(
                                      stream: queryUsersRecord(
                                        queryBuilder: (usersRecord) =>
                                            usersRecord.orderBy('display_name'),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<UsersRecord>
                                            dropDownUsersUsersRecordList =
                                            snapshot.data!;
                                        return FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .dropDownUsersValueController ??=
                                              FormFieldController<String>(null),
                                          options: dropDownUsersUsersRecordList
                                              .map((e) => e.displayName)
                                              .toList(),
                                          onChanged: null,
                                          width: 300.0,
                                          height: 50.0,
                                          searchHintTextStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: Color(0xFF005568),
                                                  ),
                                          hintText: 'Submitted by',
                                          searchHintText: 'Search for user',
                                          searchCursorColor: Color(0xFF005568),
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: Color(0xFF005568),
                                            size: 24.0,
                                          ),
                                          fillColor: Colors.white,
                                          elevation: 2.0,
                                          borderColor: Color(0xFFC6D8E0),
                                          borderWidth: 2.0,
                                          borderRadius: 24.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 4.0, 16.0, 4.0),
                                          hidesUnderline: true,
                                          isSearchable: true,
                                          isMultiSelect: true,
                                          onChangedForMultiSelect: (val) async {
                                            setState(() => _model
                                                .dropDownUsersValue = val);
                                            setState(() {
                                              _model.submittedUsers = _model
                                                  .dropDownUsersValue!
                                                  .toList()
                                                  .cast<String>();
                                            });
                                          },
                                        );
                                      },
                                    ),
                                  ].divide(SizedBox(width: 20.0)),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    FFButtonWidget(
                                      onPressed: () async {
                                        if (_model.usersId.length.toString() !=
                                            '0') {
                                          await actions
                                              .fetchUsersAndExportToExcel(
                                            _model.usersId.toList(),
                                          );
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Error'),
                                                content:
                                                    Text('Please select users'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }
                                      },
                                      text: 'Download Users',
                                      icon: Icon(
                                        Icons.file_download_outlined,
                                        size: 14.0,
                                      ),
                                      options: FFButtonOptions(
                                        width: 140.0,
                                        height: 24.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                              fontSize: 12.0,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        if (_model.usersId.length.toString() !=
                                            '0') {
                                          await actions
                                              .fetchUsersTransacAndExportToExcel(
                                            _model.usersId.toList(),
                                          );
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Error'),
                                                content:
                                                    Text('Please select users'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }
                                      },
                                      text: 'Download Trx',
                                      icon: Icon(
                                        Icons.file_download_outlined,
                                        size: 14.0,
                                      ),
                                      options: FFButtonOptions(
                                        width: 140.0,
                                        height: 24.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                              fontSize: 12.0,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        if (_model.usersId.length.toString() !=
                                            '0') {
                                          await actions.printList(
                                            _model.usersId.toList(),
                                          );
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Error'),
                                                content:
                                                    Text('Please select users'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }
                                      },
                                      text: 'Delete',
                                      icon: Icon(
                                        Icons.delete_outlined,
                                        size: 14.0,
                                      ),
                                      options: FFButtonOptions(
                                        width: 80.0,
                                        height: 24.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                              fontSize: 12.0,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        if (_model.usersId.length.toString() !=
                                            '0') {
                                          _model.apiResultNotify =
                                              await SendNotificationCall.call(
                                            title: 'test',
                                            pushBody: 'test',
                                            usersList: _model.usersId,
                                          );
                                          if ((_model
                                                  .apiResultNotify?.succeeded ??
                                              true)) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'sent',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            );
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'not sent',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            );
                                          }
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Error'),
                                                content:
                                                    Text('Please select users'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }

                                        setState(() {});
                                      },
                                      text: 'Notify All',
                                      icon: Icon(
                                        Icons.notifications,
                                        size: 14.0,
                                      ),
                                      options: FFButtonOptions(
                                        width: 100.0,
                                        height: 24.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                              fontSize: 12.0,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    Text(
                                      _model.usersId.length.toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.black,
                                          ),
                                    ),
                                  ].divide(SizedBox(width: 20.0)),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Theme(
                                      data: ThemeData(
                                        checkboxTheme: CheckboxThemeData(
                                          visualDensity: VisualDensity.standard,
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.padded,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                        ),
                                        unselectedWidgetColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                      ),
                                      child: Checkbox(
                                        value: _model.checkboxheadValue ??=
                                            false,
                                        onChanged: (newValue) async {
                                          setState(() => _model
                                              .checkboxheadValue = newValue!);
                                          if (newValue!) {
                                            setState(() {
                                              _model.checkHead = true;
                                            });
                                          } else {
                                            setState(() {
                                              _model.checkHead = false;
                                            });
                                          }
                                        },
                                        activeColor: Color(0xFF01819D),
                                        checkColor:
                                            FlutterFlowTheme.of(context).info,
                                      ),
                                    ),
                                    Flexible(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            40.0, 0.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Flexible(
                                              child: Container(
                                                width: 100.0,
                                                child: TextFormField(
                                                  controller:
                                                      _model.textController1,
                                                  autofocus: true,
                                                  readOnly: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium,
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium,
                                                    enabledBorder:
                                                        InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    errorBorder:
                                                        InputBorder.none,
                                                    focusedErrorBorder:
                                                        InputBorder.none,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                  validator: _model
                                                      .textController1Validator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              child: Container(
                                                width: 100.0,
                                                child: TextFormField(
                                                  controller:
                                                      _model.textController2,
                                                  autofocus: true,
                                                  readOnly: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium,
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium,
                                                    enabledBorder:
                                                        InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    errorBorder:
                                                        InputBorder.none,
                                                    focusedErrorBorder:
                                                        InputBorder.none,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                  validator: _model
                                                      .textController2Validator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              child: Container(
                                                width: 100.0,
                                                child: TextFormField(
                                                  controller:
                                                      _model.textController3,
                                                  autofocus: true,
                                                  readOnly: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium,
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium,
                                                    enabledBorder:
                                                        InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    errorBorder:
                                                        InputBorder.none,
                                                    focusedErrorBorder:
                                                        InputBorder.none,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                  validator: _model
                                                      .textController3Validator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              child: Container(
                                                width: 100.0,
                                                child: TextFormField(
                                                  controller:
                                                      _model.textController4,
                                                  autofocus: true,
                                                  readOnly: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium,
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium,
                                                    enabledBorder:
                                                        InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    errorBorder:
                                                        InputBorder.none,
                                                    focusedErrorBorder:
                                                        InputBorder.none,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                  validator: _model
                                                      .textController4Validator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              child: Container(
                                                width: 73.0,
                                                child: TextFormField(
                                                  controller:
                                                      _model.textController5,
                                                  autofocus: true,
                                                  readOnly: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium,
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium,
                                                    enabledBorder:
                                                        InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    errorBorder:
                                                        InputBorder.none,
                                                    focusedErrorBorder:
                                                        InputBorder.none,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                  validator: _model
                                                      .textController5Validator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              child: Container(
                                                width: 50.0,
                                                child: TextFormField(
                                                  controller:
                                                      _model.textController6,
                                                  autofocus: true,
                                                  readOnly: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium,
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium,
                                                    enabledBorder:
                                                        InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    errorBorder:
                                                        InputBorder.none,
                                                    focusedErrorBorder:
                                                        InputBorder.none,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                  validator: _model
                                                      .textController6Validator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 50.0)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                StreamBuilder<List<UsersRecord>>(
                                  stream: queryUsersRecord(
                                    queryBuilder: (usersRecord) => usersRecord
                                        .where('sms_access',
                                            isEqualTo: _model.statusType)
                                        .whereIn(
                                            'display_name',
                                            _model.submittedUsers != ''
                                                ? _model.submittedUsers
                                                : null),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<UsersRecord> listViewUsersRecordList =
                                        snapshot.data!
                                            .where(
                                                (u) => u.uid != currentUserUid)
                                            .toList();
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: listViewUsersRecordList.length,
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewUsersRecord =
                                            listViewUsersRecordList[
                                                listViewIndex];
                                        return Container(
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: _model.checkboxValueMap[
                                                        listViewUsersRecord] ==
                                                    true
                                                ? Color(0xFFF2FDFF)
                                                : Color(0x00000000),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Theme(
                                                data: ThemeData(
                                                  checkboxTheme:
                                                      CheckboxThemeData(
                                                    visualDensity:
                                                        VisualDensity.standard,
                                                    materialTapTargetSize:
                                                        MaterialTapTargetSize
                                                            .padded,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                    ),
                                                  ),
                                                  unselectedWidgetColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                ),
                                                child: Checkbox(
                                                  value: _model
                                                              .checkboxValueMap[
                                                          listViewUsersRecord] ??=
                                                      false,
                                                  onChanged: (newValue) async {
                                                    setState(() => _model
                                                                .checkboxValueMap[
                                                            listViewUsersRecord] =
                                                        newValue!);
                                                    if (newValue!) {
                                                      setState(() {
                                                        _model.addToUsersId(
                                                            listViewUsersRecord
                                                                .uid);
                                                      });
                                                    } else {
                                                      setState(() {
                                                        _model.removeFromUsersId(
                                                            listViewUsersRecord
                                                                .uid);
                                                      });
                                                    }
                                                  },
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  checkColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        40.0, 0.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width: 100.0,
                                                      height: 25.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Text(
                                                        listViewUsersRecord
                                                            .displayName,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 100.0,
                                                      height: 25.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Text(
                                                        listViewUsersRecord
                                                            .city,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 100.0,
                                                      height: 25.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Text(
                                                        listViewUsersRecord
                                                            .state,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 100.0,
                                                      height: 25.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Text(
                                                        dateTimeFormat(
                                                            'relative',
                                                            listViewUsersRecord
                                                                .lastRefreshed!),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 73.0,
                                                      height: 25.0,
                                                      decoration: BoxDecoration(
                                                        color: listViewUsersRecord
                                                                    .smsAccess ==
                                                                true
                                                            ? Color(0xFF12B76A)
                                                            : Color(0xFFFFB7B7),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.00, 0.00),
                                                      child: Text(
                                                        listViewUsersRecord
                                                                    .smsAccess ==
                                                                true
                                                            ? 'Active'
                                                            : 'Inactive',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 50.0,
                                                      height: 25.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Text(
                                                        listViewUsersRecord
                                                                    .isAdmin ==
                                                                true
                                                            ? 'Admin'
                                                            : ' ',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ),
                                                    FFButtonWidget(
                                                      onPressed: () async {
                                                        _model.apiResultNotifysingle =
                                                            await NotifySingleCall
                                                                .call(
                                                          userid:
                                                              listViewUsersRecord
                                                                  .uid,
                                                        );
                                                        if ((_model
                                                                .apiResultNotifysingle
                                                                ?.succeeded ??
                                                            true)) {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'sent',
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                            ),
                                                          );
                                                        } else {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'not sent',
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                            ),
                                                          );
                                                        }

                                                        setState(() {});
                                                      },
                                                      text: 'Notify',
                                                      options: FFButtonOptions(
                                                        height: 40.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                        elevation: 3.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 50.0)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ].divide(SizedBox(height: 20.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
