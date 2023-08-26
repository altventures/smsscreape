import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sms_permission_model.dart';
export 'sms_permission_model.dart';

class SmsPermissionWidget extends StatefulWidget {
  const SmsPermissionWidget({Key? key}) : super(key: key);

  @override
  _SmsPermissionWidgetState createState() => _SmsPermissionWidgetState();
}

class _SmsPermissionWidgetState extends State<SmsPermissionWidget> {
  late SmsPermissionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SmsPermissionModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
            child: FutureBuilder<List<LogsRecord>>(
              future: queryLogsRecordOnce(
                parent: currentUserReference,
                queryBuilder: (logsRecord) =>
                    logsRecord.orderBy('lastRecordTime', descending: true),
                singleRecord: true,
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),
                  );
                }
                List<LogsRecord> columnLogsRecordList = snapshot.data!;
                final columnLogsRecord = columnLogsRecordList.isNotEmpty
                    ? columnLogsRecordList.first
                    : null;
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'To record your transactional data, we require access to to access your SMS. Please click the button below',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            fontSize: 18.0,
                          ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          _model.permissionRes =
                              await actions.readSmsPermission();
                          if (_model.permissionRes!) {
                            _model.readMessages = await actions.readMessages(
                              columnLogsRecord,
                            );
                            while (
                                _model.looooop! < _model.readMessages!.length) {
                              _model.transTime =
                                  await actions.unixTimestampToDateAndTime(
                                getJsonField(
                                  _model.readMessages![_model.looooop!],
                                  r'''$.unixTime''',
                                ),
                              );

                              await TransactionsRecord.createDoc(
                                      currentUserReference!)
                                  .set(createTransactionsRecordData(
                                dateUnix: getJsonField(
                                  _model.readMessages?[_model.looooop!],
                                  r'''$.unixTime''',
                                ),
                                amount: getJsonField(
                                  _model.readMessages?[_model.looooop!],
                                  r'''$.amount''',
                                ),
                                transacDate: _model.transTime,
                              ));
                              setState(() {
                                _model.looooop = _model.looooop! + 1;
                              });
                            }

                            await LogsRecord.createDoc(currentUserReference!)
                                .set(createLogsRecordData(
                              lastRecordTime: getCurrentTimestamp,
                              noOfFields: _model.looooop,
                            ));

                            context.pushNamed('permission_successful');
                          } else {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Error'),
                                  content: Text('Permission Denied'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Permission Denied'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }

                          setState(() {});
                        },
                        text: 'Grant Sms Access ',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Colors.white,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Inter',
                                    color: Color(0xFF344054),
                                    fontWeight: FontWeight.w600,
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Color(0xFFD0D5DD),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
