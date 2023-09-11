import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';
import '../cloud_functions/cloud_functions.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class SendNotificationCall {
  static Future<ApiCallResponse> call({
    String? title = '',
    String? pushBody = '',
    List<String>? usersList,
  }) async {
    final users = _serializeList(usersList);

    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'SendNotificationCall',
        'variables': {
          'title': title,
          'pushBody': pushBody,
          'users': users,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class DeleteCall {
  static Future<ApiCallResponse> call({
    List<String>? idsList,
  }) async {
    final ids = _serializeList(idsList);

    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'DeleteCall',
        'variables': {
          'ids': ids,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class NotifySingleCall {
  static Future<ApiCallResponse> call({
    String? userid = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'NotifySingleCall',
        'variables': {
          'userid': userid,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
