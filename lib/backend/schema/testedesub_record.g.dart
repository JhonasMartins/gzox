// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'testedesub_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TestedesubRecord> _$testedesubRecordSerializer =
    new _$TestedesubRecordSerializer();

class _$TestedesubRecordSerializer
    implements StructuredSerializer<TestedesubRecord> {
  @override
  final Iterable<Type> types = const [TestedesubRecord, _$TestedesubRecord];
  @override
  final String wireName = 'TestedesubRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, TestedesubRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.codigoDoProduto;
    if (value != null) {
      result
        ..add('Codigo_do_produto')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dataDaAplicacao;
    if (value != null) {
      result
        ..add('Data_da_aplicacao')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.produtoGzox;
    if (value != null) {
      result
        ..add('produto_gzox')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.fotoDoProduto;
    if (value != null) {
      result
        ..add('Foto_do_produto')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.aplicadorCredenciado;
    if (value != null) {
      result
        ..add('Aplicador_credenciado')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.produtosSecundarios;
    if (value != null) {
      result
        ..add('Produtos_secundarios')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.placa;
    if (value != null) {
      result
        ..add('placa')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.placaPlaca;
    if (value != null) {
      result
        ..add('placa_placa')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  TestedesubRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TestedesubRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'Codigo_do_produto':
          result.codigoDoProduto = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Data_da_aplicacao':
          result.dataDaAplicacao = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'produto_gzox':
          result.produtoGzox = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Foto_do_produto':
          result.fotoDoProduto = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Aplicador_credenciado':
          result.aplicadorCredenciado = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Produtos_secundarios':
          result.produtosSecundarios.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'placa':
          result.placa = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'placa_placa':
          result.placaPlaca = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$TestedesubRecord extends TestedesubRecord {
  @override
  final String? codigoDoProduto;
  @override
  final DateTime? dataDaAplicacao;
  @override
  final String? produtoGzox;
  @override
  final String? fotoDoProduto;
  @override
  final String? aplicadorCredenciado;
  @override
  final BuiltList<String>? produtosSecundarios;
  @override
  final String? placa;
  @override
  final DocumentReference<Object?>? placaPlaca;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TestedesubRecord(
          [void Function(TestedesubRecordBuilder)? updates]) =>
      (new TestedesubRecordBuilder()..update(updates))._build();

  _$TestedesubRecord._(
      {this.codigoDoProduto,
      this.dataDaAplicacao,
      this.produtoGzox,
      this.fotoDoProduto,
      this.aplicadorCredenciado,
      this.produtosSecundarios,
      this.placa,
      this.placaPlaca,
      this.ffRef})
      : super._();

  @override
  TestedesubRecord rebuild(void Function(TestedesubRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TestedesubRecordBuilder toBuilder() =>
      new TestedesubRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TestedesubRecord &&
        codigoDoProduto == other.codigoDoProduto &&
        dataDaAplicacao == other.dataDaAplicacao &&
        produtoGzox == other.produtoGzox &&
        fotoDoProduto == other.fotoDoProduto &&
        aplicadorCredenciado == other.aplicadorCredenciado &&
        produtosSecundarios == other.produtosSecundarios &&
        placa == other.placa &&
        placaPlaca == other.placaPlaca &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc($jc(0, codigoDoProduto.hashCode),
                                    dataDaAplicacao.hashCode),
                                produtoGzox.hashCode),
                            fotoDoProduto.hashCode),
                        aplicadorCredenciado.hashCode),
                    produtosSecundarios.hashCode),
                placa.hashCode),
            placaPlaca.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TestedesubRecord')
          ..add('codigoDoProduto', codigoDoProduto)
          ..add('dataDaAplicacao', dataDaAplicacao)
          ..add('produtoGzox', produtoGzox)
          ..add('fotoDoProduto', fotoDoProduto)
          ..add('aplicadorCredenciado', aplicadorCredenciado)
          ..add('produtosSecundarios', produtosSecundarios)
          ..add('placa', placa)
          ..add('placaPlaca', placaPlaca)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TestedesubRecordBuilder
    implements Builder<TestedesubRecord, TestedesubRecordBuilder> {
  _$TestedesubRecord? _$v;

  String? _codigoDoProduto;
  String? get codigoDoProduto => _$this._codigoDoProduto;
  set codigoDoProduto(String? codigoDoProduto) =>
      _$this._codigoDoProduto = codigoDoProduto;

  DateTime? _dataDaAplicacao;
  DateTime? get dataDaAplicacao => _$this._dataDaAplicacao;
  set dataDaAplicacao(DateTime? dataDaAplicacao) =>
      _$this._dataDaAplicacao = dataDaAplicacao;

  String? _produtoGzox;
  String? get produtoGzox => _$this._produtoGzox;
  set produtoGzox(String? produtoGzox) => _$this._produtoGzox = produtoGzox;

  String? _fotoDoProduto;
  String? get fotoDoProduto => _$this._fotoDoProduto;
  set fotoDoProduto(String? fotoDoProduto) =>
      _$this._fotoDoProduto = fotoDoProduto;

  String? _aplicadorCredenciado;
  String? get aplicadorCredenciado => _$this._aplicadorCredenciado;
  set aplicadorCredenciado(String? aplicadorCredenciado) =>
      _$this._aplicadorCredenciado = aplicadorCredenciado;

  ListBuilder<String>? _produtosSecundarios;
  ListBuilder<String> get produtosSecundarios =>
      _$this._produtosSecundarios ??= new ListBuilder<String>();
  set produtosSecundarios(ListBuilder<String>? produtosSecundarios) =>
      _$this._produtosSecundarios = produtosSecundarios;

  String? _placa;
  String? get placa => _$this._placa;
  set placa(String? placa) => _$this._placa = placa;

  DocumentReference<Object?>? _placaPlaca;
  DocumentReference<Object?>? get placaPlaca => _$this._placaPlaca;
  set placaPlaca(DocumentReference<Object?>? placaPlaca) =>
      _$this._placaPlaca = placaPlaca;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TestedesubRecordBuilder() {
    TestedesubRecord._initializeBuilder(this);
  }

  TestedesubRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _codigoDoProduto = $v.codigoDoProduto;
      _dataDaAplicacao = $v.dataDaAplicacao;
      _produtoGzox = $v.produtoGzox;
      _fotoDoProduto = $v.fotoDoProduto;
      _aplicadorCredenciado = $v.aplicadorCredenciado;
      _produtosSecundarios = $v.produtosSecundarios?.toBuilder();
      _placa = $v.placa;
      _placaPlaca = $v.placaPlaca;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TestedesubRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TestedesubRecord;
  }

  @override
  void update(void Function(TestedesubRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TestedesubRecord build() => _build();

  _$TestedesubRecord _build() {
    _$TestedesubRecord _$result;
    try {
      _$result = _$v ??
          new _$TestedesubRecord._(
              codigoDoProduto: codigoDoProduto,
              dataDaAplicacao: dataDaAplicacao,
              produtoGzox: produtoGzox,
              fotoDoProduto: fotoDoProduto,
              aplicadorCredenciado: aplicadorCredenciado,
              produtosSecundarios: _produtosSecundarios?.build(),
              placa: placa,
              placaPlaca: placaPlaca,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'produtosSecundarios';
        _produtosSecundarios?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TestedesubRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
