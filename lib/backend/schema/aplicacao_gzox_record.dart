import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'aplicacao_gzox_record.g.dart';

abstract class AplicacaoGzoxRecord
    implements Built<AplicacaoGzoxRecord, AplicacaoGzoxRecordBuilder> {
  static Serializer<AplicacaoGzoxRecord> get serializer =>
      _$aplicacaoGzoxRecordSerializer;

  @BuiltValueField(wireName: 'Codigo_do_produto')
  String? get codigoDoProduto;

  @BuiltValueField(wireName: 'Data_da_aplicacao')
  DateTime? get dataDaAplicacao;

  @BuiltValueField(wireName: 'produto_gzox')
  String? get produtoGzox;

  @BuiltValueField(wireName: 'Foto_do_produto')
  String? get fotoDoProduto;

  @BuiltValueField(wireName: 'Aplicador_credenciado')
  String? get aplicadorCredenciado;

  @BuiltValueField(wireName: 'Produtos_secundarios')
  BuiltList<String>? get produtosSecundarios;

  String? get placa;

  DocumentReference? get placas;

  @BuiltValueField(wireName: 'Fotografia')
  String? get fotografia;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(AplicacaoGzoxRecordBuilder builder) => builder
    ..codigoDoProduto = ''
    ..produtoGzox = ''
    ..fotoDoProduto = ''
    ..aplicadorCredenciado = ''
    ..produtosSecundarios = ListBuilder()
    ..placa = ''
    ..fotografia = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Aplicacao_gzox');

  static Stream<AplicacaoGzoxRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<AplicacaoGzoxRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static AplicacaoGzoxRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      AplicacaoGzoxRecord(
        (c) => c
          ..codigoDoProduto = snapshot.data['Codigo_do_produto']
          ..dataDaAplicacao = safeGet(() => DateTime.fromMillisecondsSinceEpoch(
              snapshot.data['Data_da_aplicacao']))
          ..produtoGzox = snapshot.data['produto_gzox']
          ..fotoDoProduto = snapshot.data['Foto_do_produto']
          ..aplicadorCredenciado = snapshot.data['Aplicador_credenciado']
          ..produtosSecundarios =
              safeGet(() => ListBuilder(snapshot.data['Produtos_secundarios']))
          ..placa = snapshot.data['placa']
          ..placas = safeGet(() => toRef(snapshot.data['placas']))
          ..fotografia = snapshot.data['Fotografia']
          ..ffRef = AplicacaoGzoxRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<AplicacaoGzoxRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'Aplicacao_gzox',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  AplicacaoGzoxRecord._();
  factory AplicacaoGzoxRecord(
          [void Function(AplicacaoGzoxRecordBuilder) updates]) =
      _$AplicacaoGzoxRecord;

  static AplicacaoGzoxRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createAplicacaoGzoxRecordData({
  String? codigoDoProduto,
  DateTime? dataDaAplicacao,
  String? produtoGzox,
  String? fotoDoProduto,
  String? aplicadorCredenciado,
  String? placa,
  DocumentReference? placas,
  String? fotografia,
}) {
  final firestoreData = serializers.toFirestore(
    AplicacaoGzoxRecord.serializer,
    AplicacaoGzoxRecord(
      (a) => a
        ..codigoDoProduto = codigoDoProduto
        ..dataDaAplicacao = dataDaAplicacao
        ..produtoGzox = produtoGzox
        ..fotoDoProduto = fotoDoProduto
        ..aplicadorCredenciado = aplicadorCredenciado
        ..produtosSecundarios = null
        ..placa = placa
        ..placas = placas
        ..fotografia = fotografia,
    ),
  );

  return firestoreData;
}
