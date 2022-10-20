import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'manutencao_gzox_record.g.dart';

abstract class ManutencaoGzoxRecord
    implements Built<ManutencaoGzoxRecord, ManutencaoGzoxRecordBuilder> {
  static Serializer<ManutencaoGzoxRecord> get serializer =>
      _$manutencaoGzoxRecordSerializer;

  @BuiltValueField(wireName: 'Codigo_do_produto')
  String? get codigoDoProduto;

  @BuiltValueField(wireName: 'Data_da_manutencao')
  DateTime? get dataDaManutencao;

  @BuiltValueField(wireName: 'Foto_da_manutencao')
  String? get fotoDaManutencao;

  @BuiltValueField(wireName: 'Aplicador_credenciado')
  String? get aplicadorCredenciado;

  @BuiltValueField(wireName: 'O_que_foi_feito')
  String? get oQueFoiFeito;

  String? get placa;

  @BuiltValueField(wireName: 'produto_manutencao')
  String? get produtoManutencao;

  BuiltList<String>? get secund;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ManutencaoGzoxRecordBuilder builder) => builder
    ..codigoDoProduto = ''
    ..fotoDaManutencao = ''
    ..aplicadorCredenciado = ''
    ..oQueFoiFeito = ''
    ..placa = ''
    ..produtoManutencao = ''
    ..secund = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Manutencao_gzox');

  static Stream<ManutencaoGzoxRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ManutencaoGzoxRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static ManutencaoGzoxRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      ManutencaoGzoxRecord(
        (c) => c
          ..codigoDoProduto = snapshot.data['Codigo_do_produto']
          ..dataDaManutencao = safeGet(() =>
              DateTime.fromMillisecondsSinceEpoch(
                  snapshot.data['Data_da_manutencao']))
          ..fotoDaManutencao = snapshot.data['Foto_da_manutencao']
          ..aplicadorCredenciado = snapshot.data['Aplicador_credenciado']
          ..oQueFoiFeito = snapshot.data['O_que_foi_feito']
          ..placa = snapshot.data['placa']
          ..produtoManutencao = snapshot.data['produto_manutencao']
          ..secund = safeGet(() => ListBuilder(snapshot.data['secund']))
          ..ffRef = ManutencaoGzoxRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<ManutencaoGzoxRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'Manutencao_gzox',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  ManutencaoGzoxRecord._();
  factory ManutencaoGzoxRecord(
          [void Function(ManutencaoGzoxRecordBuilder) updates]) =
      _$ManutencaoGzoxRecord;

  static ManutencaoGzoxRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createManutencaoGzoxRecordData({
  String? codigoDoProduto,
  DateTime? dataDaManutencao,
  String? fotoDaManutencao,
  String? aplicadorCredenciado,
  String? oQueFoiFeito,
  String? placa,
  String? produtoManutencao,
}) {
  final firestoreData = serializers.toFirestore(
    ManutencaoGzoxRecord.serializer,
    ManutencaoGzoxRecord(
      (m) => m
        ..codigoDoProduto = codigoDoProduto
        ..dataDaManutencao = dataDaManutencao
        ..fotoDaManutencao = fotoDaManutencao
        ..aplicadorCredenciado = aplicadorCredenciado
        ..oQueFoiFeito = oQueFoiFeito
        ..placa = placa
        ..produtoManutencao = produtoManutencao
        ..secund = null,
    ),
  );

  return firestoreData;
}
