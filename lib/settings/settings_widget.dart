import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/delete_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'settings_model.dart';
export 'settings_model.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  _SettingsWidgetState createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  late SettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsModel());

    _model.textController ??=
        TextEditingController(text: currentUserDisplayName);
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
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FlutterFlowIconButton(
                      borderRadius: 20.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      fillColor: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Color(0x00000000),
                      icon: FaIcon(
                        FontAwesomeIcons.arrowLeft,
                        color: Colors.black,
                        size: 20.0,
                      ),
                      onPressed: () async {
                        context.safePop();
                      },
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'Settings',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: Color(0xFF7F56D9),
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Scrapping Status',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color: Color(0xFF667085),
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Container(
                      width: 100.0,
                      height: 100.0,
                      constraints: BoxConstraints(
                        maxWidth: 90.0,
                        maxHeight: 22.0,
                      ),
                      decoration: BoxDecoration(
                        color: _model.dropDownScrappingValue == 'Active'
                            ? Color(0xFFA6F4C5)
                            : Color(0xFFFF0000),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: AuthUserStreamWidget(
                        builder: (context) => FlutterFlowDropDown<String>(
                          controller:
                              _model.dropDownScrappingValueController ??=
                                  FormFieldController<String>(
                            _model.dropDownScrappingValue ??=
                                valueOrDefault<bool>(
                                            currentUserDocument?.smsAccess,
                                            false) ==
                                        true
                                    ? 'Active'
                                    : 'Inactive',
                          ),
                          options: ['Active', 'Inactive'],
                          onChanged: (val) async {
                            setState(() => _model.dropDownScrappingValue = val);
                            if (_model.dropDownScrappingValue == 'Inactive') {
                              await currentUserReference!
                                  .update(createUsersRecordData(
                                smsAccess: false,
                              ));
                              return;
                            } else {
                              await currentUserReference!
                                  .update(createUsersRecordData(
                                smsAccess: true,
                              ));
                              return;
                            }
                          },
                          width: 90.0,
                          height: 20.0,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: Color(0xFF6941C6),
                                    fontSize: 12.0,
                                  ),
                          hintText: 'Active',
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 12.0,
                          ),
                          elevation: 2.0,
                          borderColor: Colors.transparent,
                          borderWidth: 2.0,
                          borderRadius: 8.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 0.0, 0.0),
                          hidesUnderline: true,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Personal Info',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: Color(0xFF7F56D9),
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => TextFormField(
                            controller: _model.textController,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Display Name',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: Color(0xFF667085),
                                    fontSize: 16.0,
                                  ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: Color(0xFF667085),
                                    fontSize: 16.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFD0D5DD),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: Color(0xFF667085),
                                  fontSize: 16.0,
                                ),
                            validator: _model.textControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: AuthUserStreamWidget(
                          builder: (context) =>
                              StreamBuilder<List<StateRecord>>(
                            stream: queryStateRecord(
                              queryBuilder: (stateRecord) =>
                                  stateRecord.orderBy('name'),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 40.0,
                                    height: 40.0,
                                    child: SpinKitFadingCircle(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 40.0,
                                    ),
                                  ),
                                );
                              }
                              List<StateRecord> dropDownStateStateRecordList =
                                  snapshot.data!;
                              return FlutterFlowDropDown<String>(
                                controller:
                                    _model.dropDownStateValueController ??=
                                        FormFieldController<String>(
                                  _model.dropDownStateValue ??= valueOrDefault(
                                      currentUserDocument?.state, ''),
                                ),
                                options: dropDownStateStateRecordList
                                    .map((e) => e.name)
                                    .toList(),
                                onChanged: (val) async {
                                  setState(
                                      () => _model.dropDownStateValue = val);
                                  await currentUserReference!
                                      .update(createUsersRecordData(
                                    state: _model.dropDownStateValue,
                                  ));
                                },
                                width: 300.0,
                                height: 50.0,
                                searchHintTextStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: Color(0xFF667085),
                                      fontSize: 16.0,
                                    ),
                                hintText: 'State',
                                searchHintText: 'Search for an item...',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: Colors.white,
                                elevation: 2.0,
                                borderColor: Color(0xFFD0D5DD),
                                borderWidth: 2.0,
                                borderRadius: 8.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 4.0, 16.0, 4.0),
                                hidesUnderline: true,
                                disabled: valueOrDefault(
                                            currentUserDocument?.state, '') !=
                                        null &&
                                    valueOrDefault(
                                            currentUserDocument?.state, '') !=
                                        '',
                                isSearchable: true,
                                isMultiSelect: false,
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => StreamBuilder<List<CityRecord>>(
                            stream: queryCityRecord(
                              queryBuilder: (cityRecord) => cityRecord.where(
                                  'state_ref',
                                  isEqualTo: _model.dropDownStateValue),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 40.0,
                                    height: 40.0,
                                    child: SpinKitFadingCircle(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 40.0,
                                    ),
                                  ),
                                );
                              }
                              List<CityRecord> dropDownCityCityRecordList =
                                  snapshot.data!;
                              return FlutterFlowDropDown<String>(
                                controller:
                                    _model.dropDownCityValueController ??=
                                        FormFieldController<String>(null),
                                options: dropDownCityCityRecordList
                                    .map((e) => e.cityName)
                                    .toList(),
                                onChanged: (val) async {
                                  setState(
                                      () => _model.dropDownCityValue = val);
                                  await currentUserReference!
                                      .update(createUsersRecordData(
                                    city: _model.dropDownCityValue,
                                  ));
                                },
                                width: 300.0,
                                height: 50.0,
                                searchHintTextStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: Color(0xFF667085),
                                      fontSize: 16.0,
                                    ),
                                hintText: valueOrDefault(
                                    currentUserDocument?.city, ''),
                                searchHintText: 'Search for an item...',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: Colors.white,
                                elevation: 2.0,
                                borderColor: Color(0xFFD0D5DD),
                                borderWidth: 2.0,
                                borderRadius: 8.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 4.0, 16.0, 4.0),
                                hidesUnderline: true,
                                disabled: valueOrDefault(
                                            currentUserDocument?.state, '') !=
                                        null &&
                                    valueOrDefault(
                                            currentUserDocument?.state, '') !=
                                        '',
                                isSearchable: true,
                                isMultiSelect: false,
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await currentUserReference!
                                .update(createUsersRecordData(
                              smsAccess: false,
                            ));
                            GoRouter.of(context).prepareAuthEvent();
                            await authManager.signOut();
                            GoRouter.of(context).clearRedirectLocation();

                            context.goNamedAuth('Login', context.mounted);
                          },
                          child: Text(
                            'Logout',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: Color(0xFF7F56D9),
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ),
                      Builder(
                        builder: (context) => Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await showAlignedDialog(
                                barrierColor: Color(0xC27C7C7C),
                                context: context,
                                isGlobal: true,
                                avoidOverflow: false,
                                targetAnchor: AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                followerAnchor: AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                builder: (dialogContext) {
                                  return Material(
                                    color: Colors.transparent,
                                    child: GestureDetector(
                                      onTap: () => FocusScope.of(context)
                                          .requestFocus(_model.unfocusNode),
                                      child: Container(
                                        height: 250.0,
                                        width: 300.0,
                                        child: DeleteWidget(),
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => setState(() {}));
                            },
                            child: Text(
                              'Delete Account',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: Color(0xFFC4320A),
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
