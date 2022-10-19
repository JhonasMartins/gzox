import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'veiculo_record.g.dart';

abstract class VeiculoRecord
    implements Built<VeiculoRecord, VeiculoRecordBuilder> {
  static Serializer<VeiculoRecord> get serializer => _$veiculoRecordSerializer;

  @BuiltValueField(wireName: 'Tipo_de_veiculo')
  String? get tipoDeVeiculo;

  @BuiltValueField(wireName: 'Marca')
  String? get marca;

  @BuiltValueField(wireName: 'Modelo')
  String? get modelo;

  @BuiltValueField(wireName: 'Quilometragem')
  String? get quilometragem;

  @BuiltValueField(wireName: 'Email_do_dono_gzox')
  String? get emailDoDonoGzox;

  @BuiltValueField(wireName: 'Nome_do_dono_gzox')
  String? get nomeDoDonoGzox;

  @BuiltValueField(wireName: 'Whatsapp_do_dono_gzox')
  String? get whatsappDoDonoGzox;

  @BuiltValueField(wireName: 'Placa')
  String? get placa;

  DocumentReference? get user;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(VeiculoRecordBuilder builder) => builder
    ..tipoDeVeiculo = ''
    ..marca = ''
    ..modelo = ''
    ..quilometragem = ''
    ..emailDoDonoGzox = ''
    ..nomeDoDonoGzox = ''
    ..whatsappDoDonoGzox = ''
    ..placa = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('veiculo');

  static Stream<VeiculoRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<VeiculoRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static VeiculoRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      VeiculoRecord(
        (c) => c
          ..tipoDeVeiculo = snapshot.data['Tipo_de_veiculo']
          ..marca = snapshot.data['Marca']
          ..modelo = snapshot.data['Modelo']
          ..quilometragem = snapshot.data['Quilometragem']
          ..emailDoDonoGzox = snapshot.data['Email_do_dono_gzox']
          ..nomeDoDonoGzox = snapshot.data['Nome_do_dono_gzox']
          ..whatsappDoDonoGzox = snapshot.data['Whatsapp_do_dono_gzox']
          ..placa = snapshot.data['Placa']
          ..user = safeGet(() => toRef(snapshot.data['user']))
          ..ffRef = VeiculoRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<VeiculoRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'veiculo',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  VeiculoRecord._();
  factory VeiculoRecord([void Function(VeiculoRecordBuilder) updates]) =
      _$VeiculoRecord;

  static VeiculoRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createVeiculoRecordData({
  String? tipoDeVeiculo,
  String? marca,
  String? modelo,
  String? quilometragem,
  String? emailDoDonoGzox,
  String? nomeDoDonoGzox,
  String? whatsappDoDonoGzox,
  String? placa,
  DocumentReference? user,
}) {
  final firestoreData = serializers.toFirestore(
    VeiculoRecord.serializer,
    VeiculoRecord(
      (v) => v
        ..tipoDeVeiculo = tipoDeVeiculo
        ..marca = marca
        ..modelo = modelo
        ..quilometragem = quilometragem
        ..emailDoDonoGzox = emailDoDonoGzox
        ..nomeDoDonoGzox = nomeDoDonoGzox
        ..whatsappDoDonoGzox = whatsappDoDonoGzox
        ..placa = placa
        ..user = user,
    ),
  );

  return firestoreData;
}
