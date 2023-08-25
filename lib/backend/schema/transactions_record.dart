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

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _transacDate = snapshotData['transac_date'] as DateTime?;
    _transacNote = snapshotData['transac_note'] as String?;
    _dateUnix = castToType<int>(snapshotData['date_unix']);
    _amount = castToType<double>(snapshotData['amount']);
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
  DateTime? transacDate,
  String? transacNote,
  int? dateUnix,
  double? amount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'transac_date': transacDate,
      'transac_note': transacNote,
      'date_unix': dateUnix,
      'amount': amount,
    }.withoutNulls,
  );

  return firestoreData;
}

class TransactionsRecordDocumentEquality
    implements Equality<TransactionsRecord> {
  const TransactionsRecordDocumentEquality();

  @override
  bool equals(TransactionsRecord? e1, TransactionsRecord? e2) {
    return e1?.transacDate == e2?.transacDate &&
        e1?.transacNote == e2?.transacNote &&
        e1?.dateUnix == e2?.dateUnix &&
        e1?.amount == e2?.amount;
  }

  @override
  int hash(TransactionsRecord? e) => const ListEquality()
      .hash([e?.transacDate, e?.transacNote, e?.dateUnix, e?.amount]);

  @override
  bool isValidKey(Object? o) => o is TransactionsRecord;
}
