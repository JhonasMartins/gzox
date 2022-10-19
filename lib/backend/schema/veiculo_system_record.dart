import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'veiculo_system_record.g.dart';

abstract class VeiculoSystemRecord
    implements Built<VeiculoSystemRecord, VeiculoSystemRecordBuilder> {
  static Serializer<VeiculoSystemRecord> get serializer =>
      _$veiculoSystemRecordSerializer;

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

  static void _initializeBuilder(VeiculoSystemRecordBuilder builder) => builder
    ..tipoDeVeiculo = ''
    ..marca = ''
    ..modelo = ''
    ..quilometragem = ''
    ..emailDoDonoGzox = ''
    ..nomeDoDonoGzox = ''
    ..whatsappDoDonoGzox = ''
    ..placa = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('veiculo_system');

  static Stream<VeiculoSystemRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<VeiculoSystemRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static VeiculoSystemRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      VeiculoSystemRecord(
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
          ..ffRef = VeiculoSystemRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<VeiculoSystemRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'veiculo_system',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  VeiculoSystemRecord._();
  factory VeiculoSystemRecord(
          [void Function(VeiculoSystemRecordBuilder) updates]) =
      _$VeiculoSystemRecord;

  static VeiculoSystemRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createVeiculoSystemRecordData({
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
    VeiculoSystemRecord.serializer,
    VeiculoSystemRecord(
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
