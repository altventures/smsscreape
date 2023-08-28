import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AuthUserStreamWidget(
                          builder: (context) => Text(
                            currentUserDisplayName,
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                        Text(
                          currentUserEmail,
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ],
                    ),
                    FlutterFlowIconButton(
                      borderRadius: 20.0,
                      borderWidth: 1.0,
                      buttonSize: 50.0,
                      icon: Icon(
                        Icons.settings,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        context.pushNamed('settings');
                      },
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 1.0,
                color: Color(0xCCD9D9D9),
              ),
              Expanded(
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
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 20.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Transaction History',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: Color(0xFF7F56D9),
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    _model.permissionRes =
                                        await actions.readSmsPermission();
                                    if (_model.permissionRes!) {
                                      _model.readMessages =
                                          await actions.readMessages(
                                        columnLogsRecord,
                                      );

                                      await currentUserReference!
                                          .update(createUsersRecordData(
                                        smsAccess: true,
                                      ));
                                      if (_model.readMessages?.length != 0) {
                                        while (_model.looooop! <
                                            _model.readMessages!.length) {
                                          _model.transTime = await actions
                                              .unixTimestampToDateAndTime(
                                            getJsonField(
                                              _model.readMessages![
                                                  _model.looooop!],
                                              r'''$.unixTime''',
                                            ),
                                          );

                                          await TransactionsRecord.createDoc(
                                                  currentUserReference!)
                                              .set(createTransactionsRecordData(
                                            dateUnix: getJsonField(
                                              _model.readMessages?[
                                                  _model.looooop!],
                                              r'''$.unixTime''',
                                            ),
                                            amount: getJsonField(
                                              _model.readMessages?[
                                                  _model.looooop!],
                                              r'''$.amount''',
                                            ),
                                            transacDate: _model.transTime,
                                          ));
                                          setState(() {
                                            _model.looooop =
                                                _model.looooop! + 1;
                                          });
                                        }

                                        await LogsRecord.createDoc(
                                                currentUserReference!)
                                            .set(createLogsRecordData(
                                          lastRecordTime: getCurrentTimestamp,
                                          noOfFields: _model.looooop,
                                        ));
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Success'),
                                              content: Text(
                                                  '${_model.looooop?.toString()} entered into the Database'),
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
                                        setState(() {
                                          _model.looooop = 0;
                                        });
                                      }
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Error'),
                                            content: Text('Permission Denied'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child:
                                                    Text('Permission Denied'),
                                              ),
                                            ],
                                          );
                                        },
                                      );

                                      await currentUserReference!
                                          .update(createUsersRecordData(
                                        smsAccess: false,
                                      ));
                                    }

                                    setState(() {});
                                  },
                                  text: '',
                                  icon: Icon(
                                    Icons.replay,
                                    size: 15.0,
                                  ),
                                  options: FFButtonOptions(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Color(0xFFA6F4C5),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Inter',
                                          color: Color(0xFF6941C6),
                                          fontSize: 32.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                    elevation: 0.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 20.0),
                              child: StreamBuilder<List<TransactionsRecord>>(
                                stream: queryTransactionsRecord(
                                  parent: currentUserReference,
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
                                  List<TransactionsRecord>
                                      listViewTransactionsRecordList =
                                      snapshot.data!;
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        listViewTransactionsRecordList.length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewTransactionsRecord =
                                          listViewTransactionsRecordList[
                                              listViewIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 5.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 5.0, 0.0),
                                              child: Container(
                                                width: 23.0,
                                                height: 75.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF7B61FF),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                width: 100.0,
                                                height: 75.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  8.0,
                                                                  0.0,
                                                                  2.0),
                                                      child: Text(
                                                        'USD ${listViewTransactionsRecord.amount.toString()}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  2.0),
                                                      child: Text(
                                                        '${listViewTransactionsRecord.transacDate?.toString()}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ),
                                                    Text(
                                                      listViewTransactionsRecord
                                                          .transacNote,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
