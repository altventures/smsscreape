import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CityRecord extends FirestoreRecord {
  CityRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "city_name" field.
  String? _cityName;
  String get cityName => _cityName ?? '';
  bool hasCityName() => _cityName != null;

  // "state_ref" field.
  String? _stateRef;
  String get stateRef => _stateRef ?? '';
  bool hasStateRef() => _stateRef != null;

  void _initializeFields() {
    _cityName = snapshotData['city_name'] as String?;
    _stateRef = snapshotData['state_ref'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('city');

  static Stream<CityRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CityRecord.fromSnapshot(s));

  static Future<CityRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CityRecord.fromSnapshot(s));

  static CityRecord fromSnapshot(DocumentSnapshot snapshot) => CityRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CityRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CityRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CityRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CityRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCityRecordData({
  String? cityName,
  String? stateRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'city_name': cityName,
      'state_ref': stateRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class CityRecordDocumentEquality implements Equality<CityRecord> {
  const CityRecordDocumentEquality();

  @override
  bool equals(CityRecord? e1, CityRecord? e2) {
    return e1?.cityName == e2?.cityName && e1?.stateRef == e2?.stateRef;
  }

  @override
  int hash(CityRecord? e) =>
      const ListEquality().hash([e?.cityName, e?.stateRef]);

  @override
  bool isValidKey(Object? o) => o is CityRecord;
}
