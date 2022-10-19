import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'dados_do_aplicador_record.g.dart';

abstract class DadosDoAplicadorRecord
    implements Built<DadosDoAplicadorRecord, DadosDoAplicadorRecordBuilder> {
  static Serializer<DadosDoAplicadorRecord> get serializer =>
      _$dadosDoAplicadorRecordSerializer;

  @BuiltValueField(wireName: 'Nome_do_aplicador')
  String? get nomeDoAplicador;

  @BuiltValueField(wireName: 'Whatsapp_do_aplicador')
  String? get whatsappDoAplicador;

  @BuiltValueField(wireName: 'Foto_do_aplicador')
  String? get fotoDoAplicador;

  DocumentReference? get user;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(DadosDoAplicadorRecordBuilder builder) =>
      builder
        ..nomeDoAplicador = ''
        ..whatsappDoAplicador = ''
        ..fotoDoAplicador = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('dados_do_aplicador');

  static Stream<DadosDoAplicadorRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<DadosDoAplicadorRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static DadosDoAplicadorRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      DadosDoAplicadorRecord(
        (c) => c
          ..nomeDoAplicador = snapshot.data['Nome_do_aplicador']
          ..whatsappDoAplicador = snapshot.data['Whatsapp_do_aplicador']
          ..fotoDoAplicador = snapshot.data['Foto_do_aplicador']
          ..user = safeGet(() => toRef(snapshot.data['user']))
          ..ffRef = DadosDoAplicadorRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<DadosDoAplicadorRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'dados_do_aplicador',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  DadosDoAplicadorRecord._();
  factory DadosDoAplicadorRecord(
          [void Function(DadosDoAplicadorRecordBuilder) updates]) =
      _$DadosDoAplicadorRecord;

  static DadosDoAplicadorRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createDadosDoAplicadorRecordData({
  String? nomeDoAplicador,
  String? whatsappDoAplicador,
  String? fotoDoAplicador,
  DocumentReference? user,
}) {
  final firestoreData = serializers.toFirestore(
    DadosDoAplicadorRecord.serializer,
    DadosDoAplicadorRecord(
      (d) => d
        ..nomeDoAplicador = nomeDoAplicador
        ..whatsappDoAplicador = whatsappDoAplicador
        ..fotoDoAplicador = fotoDoAplicador
        ..user = user,
    ),
  );

  return firestoreData;
}
