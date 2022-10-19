import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'testedesub_record.g.dart';

abstract class TestedesubRecord
    implements Built<TestedesubRecord, TestedesubRecordBuilder> {
  static Serializer<TestedesubRecord> get serializer =>
      _$testedesubRecordSerializer;

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

  @BuiltValueField(wireName: 'placa_placa')
  DocumentReference? get placaPlaca;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(TestedesubRecordBuilder builder) => builder
    ..codigoDoProduto = ''
    ..produtoGzox = ''
    ..fotoDoProduto = ''
    ..aplicadorCredenciado = ''
    ..produtosSecundarios = ListBuilder()
    ..placa = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('testedesub')
          : FirebaseFirestore.instance.collectionGroup('testedesub');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('testedesub').doc();

  static Stream<TestedesubRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TestedesubRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TestedesubRecord._();
  factory TestedesubRecord([void Function(TestedesubRecordBuilder) updates]) =
      _$TestedesubRecord;

  static TestedesubRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTestedesubRecordData({
  String? codigoDoProduto,
  DateTime? dataDaAplicacao,
  String? produtoGzox,
  String? fotoDoProduto,
  String? aplicadorCredenciado,
  String? placa,
  DocumentReference? placaPlaca,
}) {
  final firestoreData = serializers.toFirestore(
    TestedesubRecord.serializer,
    TestedesubRecord(
      (t) => t
        ..codigoDoProduto = codigoDoProduto
        ..dataDaAplicacao = dataDaAplicacao
        ..produtoGzox = produtoGzox
        ..fotoDoProduto = fotoDoProduto
        ..aplicadorCredenciado = aplicadorCredenciado
        ..produtosSecundarios = null
        ..placa = placa
        ..placaPlaca = placaPlaca,
    ),
  );

  return firestoreData;
}
