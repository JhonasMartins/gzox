// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aplicacao_gzox_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AplicacaoGzoxRecord> _$aplicacaoGzoxRecordSerializer =
    new _$AplicacaoGzoxRecordSerializer();

class _$AplicacaoGzoxRecordSerializer
    implements StructuredSerializer<AplicacaoGzoxRecord> {
  @override
  final Iterable<Type> types = const [
    AplicacaoGzoxRecord,
    _$AplicacaoGzoxRecord
  ];
  @override
  final String wireName = 'AplicacaoGzoxRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, AplicacaoGzoxRecord object,
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
    value = object.placas;
    if (value != null) {
      result
        ..add('placas')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.fotografia;
    if (value != null) {
      result
        ..add('Fotografia')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  AplicacaoGzoxRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AplicacaoGzoxRecordBuilder();

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
        case 'placas':
          result.placas = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'Fotografia':
          result.fotografia = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$AplicacaoGzoxRecord extends AplicacaoGzoxRecord {
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
  final DocumentReference<Object?>? placas;
  @override
  final String? fotografia;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$AplicacaoGzoxRecord(
          [void Function(AplicacaoGzoxRecordBuilder)? updates]) =>
      (new AplicacaoGzoxRecordBuilder()..update(updates))._build();

  _$AplicacaoGzoxRecord._(
      {this.codigoDoProduto,
      this.dataDaAplicacao,
      this.produtoGzox,
      this.fotoDoProduto,
      this.aplicadorCredenciado,
      this.produtosSecundarios,
      this.placa,
      this.placas,
      this.fotografia,
      this.ffRef})
      : super._();

  @override
  AplicacaoGzoxRecord rebuild(
          void Function(AplicacaoGzoxRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AplicacaoGzoxRecordBuilder toBuilder() =>
      new AplicacaoGzoxRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AplicacaoGzoxRecord &&
        codigoDoProduto == other.codigoDoProduto &&
        dataDaAplicacao == other.dataDaAplicacao &&
        produtoGzox == other.produtoGzox &&
        fotoDoProduto == other.fotoDoProduto &&
        aplicadorCredenciado == other.aplicadorCredenciado &&
        produtosSecundarios == other.produtosSecundarios &&
        placa == other.placa &&
        placas == other.placas &&
        fotografia == other.fotografia &&
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
                                $jc(
                                    $jc($jc(0, codigoDoProduto.hashCode),
                                        dataDaAplicacao.hashCode),
                                    produtoGzox.hashCode),
                                fotoDoProduto.hashCode),
                            aplicadorCredenciado.hashCode),
                        produtosSecundarios.hashCode),
                    placa.hashCode),
                placas.hashCode),
            fotografia.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AplicacaoGzoxRecord')
          ..add('codigoDoProduto', codigoDoProduto)
          ..add('dataDaAplicacao', dataDaAplicacao)
          ..add('produtoGzox', produtoGzox)
          ..add('fotoDoProduto', fotoDoProduto)
          ..add('aplicadorCredenciado', aplicadorCredenciado)
          ..add('produtosSecundarios', produtosSecundarios)
          ..add('placa', placa)
          ..add('placas', placas)
          ..add('fotografia', fotografia)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class AplicacaoGzoxRecordBuilder
    implements Builder<AplicacaoGzoxRecord, AplicacaoGzoxRecordBuilder> {
  _$AplicacaoGzoxRecord? _$v;

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

  DocumentReference<Object?>? _placas;
  DocumentReference<Object?>? get placas => _$this._placas;
  set placas(DocumentReference<Object?>? placas) => _$this._placas = placas;

  String? _fotografia;
  String? get fotografia => _$this._fotografia;
  set fotografia(String? fotografia) => _$this._fotografia = fotografia;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  AplicacaoGzoxRecordBuilder() {
    AplicacaoGzoxRecord._initializeBuilder(this);
  }

  AplicacaoGzoxRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _codigoDoProduto = $v.codigoDoProduto;
      _dataDaAplicacao = $v.dataDaAplicacao;
      _produtoGzox = $v.produtoGzox;
      _fotoDoProduto = $v.fotoDoProduto;
      _aplicadorCredenciado = $v.aplicadorCredenciado;
      _produtosSecundarios = $v.produtosSecundarios?.toBuilder();
      _placa = $v.placa;
      _placas = $v.placas;
      _fotografia = $v.fotografia;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AplicacaoGzoxRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AplicacaoGzoxRecord;
  }

  @override
  void update(void Function(AplicacaoGzoxRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AplicacaoGzoxRecord build() => _build();

  _$AplicacaoGzoxRecord _build() {
    _$AplicacaoGzoxRecord _$result;
    try {
      _$result = _$v ??
          new _$AplicacaoGzoxRecord._(
              codigoDoProduto: codigoDoProduto,
              dataDaAplicacao: dataDaAplicacao,
              produtoGzox: produtoGzox,
              fotoDoProduto: fotoDoProduto,
              aplicadorCredenciado: aplicadorCredenciado,
              produtosSecundarios: _produtosSecundarios?.build(),
              placa: placa,
              placas: placas,
              fotografia: fotografia,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'produtosSecundarios';
        _produtosSecundarios?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AplicacaoGzoxRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
