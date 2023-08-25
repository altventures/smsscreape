import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransactionsRecord extends FirestoreRecord {
  TransactionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "transac_amount" field.
  int? _transacAmount;
  int get transacAmount => _transacAmount ?? 0;
  bool hasTransacAmount() => _transacAmount != null;

  // "transac_date" field.
  DateTime? _transacDate;
  DateTime? get transacDate => _transacDate;
  bool hasTransacDate() => _transacDate != null;

  // "transac_note" field.
  String? _transacNote;
  String get transacNote => _transacNote ?? '';
  bool hasTransacNote() => _transacNote != null;

  // "date_unix" field.
  int? _dateUnix;
  int get dateUnix => _dateUnix ?? 0;
  bool hasDateUnix() => _dateUnix != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _transacAmount = castToType<int>(snapshotData['transac_amount']);
    _transacDate = snapshotData['transac_date'] as DateTime?;
    _transacNote = snapshotData['transac_note'] as String?;
    _dateUnix = castToType<int>(snapshotData['date_unix']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('transactions')
          : FirebaseFirestore.instance.collectionGroup('transactions');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('transactions').doc();

  static Stream<TransactionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TransactionsRecord.fromSnapshot(s));

  static Future<TransactionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TransactionsRecord.fromSnapshot(s));

  static TransactionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TransactionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TransactionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TransactionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TransactionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TransactionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTransactionsRecordData({
  int? transacAmount,
  DateTime? transacDate,
  String? transacNote,
  int? dateUnix,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'transac_amount': transacAmount,
      'transac_date': transacDate,
      'transac_note': transacNote,
      'date_unix': dateUnix,
    }.withoutNulls,
  );

  return firestoreData;
}

class TransactionsRecordDocumentEquality
    implements Equality<TransactionsRecord> {
  const TransactionsRecordDocumentEquality();

  @override
  bool equals(TransactionsRecord? e1, TransactionsRecord? e2) {
    return e1?.transacAmount == e2?.transacAmount &&
        e1?.transacDate == e2?.transacDate &&
        e1?.transacNote == e2?.transacNote &&
        e1?.dateUnix == e2?.dateUnix;
  }

  @override
  int hash(TransactionsRecord? e) => const ListEquality()
      .hash([e?.transacAmount, e?.transacDate, e?.transacNote, e?.dateUnix]);

  @override
  bool isValidKey(Object? o) => o is TransactionsRecord;
}
