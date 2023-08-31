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
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  int? looooop = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - readSmsPermission] action in Button widget.
  bool? permissionRes;
  // Stores action output result for [Custom Action - readMessages] action in Button widget.
  List<dynamic>? readMessages;
  // Stores action output result for [Custom Action - unixTimestampToDateAndTime] action in Button widget.
  DateTime? transTime;
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, TransactionsRecord>?
      listViewPagingController;
  Query? listViewPagingQuery;
  List<StreamSubscription?> listViewStreamSubscriptions = [];

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    listViewStreamSubscriptions.forEach((s) => s?.cancel());
    listViewPagingController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  PagingController<DocumentSnapshot?, TransactionsRecord> setListViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController ??= _createListViewController(query, parent);
    if (listViewPagingQuery != query) {
      listViewPagingQuery = query;
      listViewPagingController?.refresh();
    }
    return listViewPagingController!;
  }

  PagingController<DocumentSnapshot?, TransactionsRecord>
      _createListViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller = PagingController<DocumentSnapshot?, TransactionsRecord>(
        firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryTransactionsRecordPage(
          parent: parent,
          queryBuilder: (_) => listViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions,
          controller: controller,
          pageSize: 20,
          isStream: true,
        ),
      );
  }
}
