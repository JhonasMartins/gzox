import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'mapas_record.g.dart';

abstract class MapasRecord implements Built<MapasRecord, MapasRecordBuilder> {
  static Serializer<MapasRecord> get serializer => _$mapasRecordSerializer;

  @BuiltValueField(wireName: 'latitude_logitude')
  LatLng? get latitudeLogitude;

  @BuiltValueField(wireName: 'Rua')
  String? get rua;

  String? get bairro;

  String? get cidade;

  String? get estado;

  String? get pais;

  DocumentReference? get user;

  @BuiltValueField(wireName: 'Nome_da_estetica')
  String? get nomeDaEstetica;

  String? get whatsapp;

  String? get email;

  String? get foto;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(MapasRecordBuilder builder) => builder
    ..rua = ''
    ..bairro = ''
    ..cidade = ''
    ..estado = ''
    ..pais = ''
    ..nomeDaEstetica = ''
    ..whatsapp = ''
    ..email = ''
    ..foto = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('mapas');

  static Stream<MapasRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<MapasRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  MapasRecord._();
  factory MapasRecord([void Function(MapasRecordBuilder) updates]) =
      _$MapasRecord;

  static MapasRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createMapasRecordData({
  LatLng? latitudeLogitude,
  String? rua,
  String? bairro,
  String? cidade,
  String? estado,
  String? pais,
  DocumentReference? user,
  String? nomeDaEstetica,
  String? whatsapp,
  String? email,
  String? foto,
}) {
  final firestoreData = serializers.toFirestore(
    MapasRecord.serializer,
    MapasRecord(
      (m) => m
        ..latitudeLogitude = latitudeLogitude
        ..rua = rua
        ..bairro = bairro
        ..cidade = cidade
        ..estado = estado
        ..pais = pais
        ..user = user
        ..nomeDaEstetica = nomeDaEstetica
        ..whatsapp = whatsapp
        ..email = email
        ..foto = foto,
    ),
  );

  return firestoreData;
}
