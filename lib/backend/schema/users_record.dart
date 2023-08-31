import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  // "sms_access" field.
  bool? _smsAccess;
  bool get smsAccess => _smsAccess ?? false;
  bool hasSmsAccess() => _smsAccess != null;

  // "otp" field.
  int? _otp;
  int get otp => _otp ?? 0;
  bool hasOtp() => _otp != null;

  // "email_status" field.
  String? _emailStatus;
  String get emailStatus => _emailStatus ?? '';
  bool hasEmailStatus() => _emailStatus != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "last_refreshed" field.
  DateTime? _lastRefreshed;
  DateTime? get lastRefreshed => _lastRefreshed;
  bool hasLastRefreshed() => _lastRefreshed != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _city = snapshotData['city'] as String?;
    _state = snapshotData['state'] as String?;
    _smsAccess = snapshotData['sms_access'] as bool?;
    _otp = castToType<int>(snapshotData['otp']);
    _emailStatus = snapshotData['email_status'] as String?;
    _status = snapshotData['status'] as String?;
    _lastRefreshed = snapshotData['last_refreshed'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? city,
  String? state,
  bool? smsAccess,
  int? otp,
  String? emailStatus,
  String? status,
  DateTime? lastRefreshed,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'city': city,
      'state': state,
      'sms_access': smsAccess,
      'otp': otp,
      'email_status': emailStatus,
      'status': status,
      'last_refreshed': lastRefreshed,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.city == e2?.city &&
        e1?.state == e2?.state &&
        e1?.smsAccess == e2?.smsAccess &&
        e1?.otp == e2?.otp &&
        e1?.emailStatus == e2?.emailStatus &&
        e1?.status == e2?.status &&
        e1?.lastRefreshed == e2?.lastRefreshed;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.city,
        e?.state,
        e?.smsAccess,
        e?.otp,
        e?.emailStatus,
        e?.status,
        e?.lastRefreshed
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
