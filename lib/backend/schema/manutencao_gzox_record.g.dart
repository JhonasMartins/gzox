// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manutencao_gzox_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ManutencaoGzoxRecord> _$manutencaoGzoxRecordSerializer =
    new _$ManutencaoGzoxRecordSerializer();

class _$ManutencaoGzoxRecordSerializer
    implements StructuredSerializer<ManutencaoGzoxRecord> {
  @override
  final Iterable<Type> types = const [
    ManutencaoGzoxRecord,
    _$ManutencaoGzoxRecord
  ];
  @override
  final String wireName = 'ManutencaoGzoxRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ManutencaoGzoxRecord object,
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
    value = object.dataDaManutencao;
    if (value != null) {
      result
        ..add('Data_da_manutencao')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.produtosSecundarios;
    if (value != null) {
      result
        ..add('Produtos_secundarios')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.fotoDaManutencao;
    if (value != null) {
      result
        ..add('Foto_da_manutencao')
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
    value = object.oQueFoiFeito;
    if (value != null) {
      result
        ..add('O_que_foi_feito')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.placa;
    if (value != null) {
      result
        ..add('placa')
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
  ManutencaoGzoxRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ManutencaoGzoxRecordBuilder();

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
        case 'Data_da_manutencao':
          result.dataDaManutencao = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'Produtos_secundarios':
          result.produtosSecundarios = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Foto_da_manutencao':
          result.fotoDaManutencao = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Aplicador_credenciado':
          result.aplicadorCredenciado = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'O_que_foi_feito':
          result.oQueFoiFeito = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'placa':
          result.placa = serializers.deserialize(value,
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

class _$ManutencaoGzoxRecord extends ManutencaoGzoxRecord {
  @override
  final String? codigoDoProduto;
  @override
  final DateTime? dataDaManutencao;
  @override
  final String? produtosSecundarios;
  @override
  final String? fotoDaManutencao;
  @override
  final String? aplicadorCredenciado;
  @override
  final String? oQueFoiFeito;
  @override
  final String? placa;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ManutencaoGzoxRecord(
          [void Function(ManutencaoGzoxRecordBuilder)? updates]) =>
      (new ManutencaoGzoxRecordBuilder()..update(updates))._build();

  _$ManutencaoGzoxRecord._(
      {this.codigoDoProduto,
      this.dataDaManutencao,
      this.produtosSecundarios,
      this.fotoDaManutencao,
      this.aplicadorCredenciado,
      this.oQueFoiFeito,
      this.placa,
      this.ffRef})
      : super._();

  @override
  ManutencaoGzoxRecord rebuild(
          void Function(ManutencaoGzoxRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ManutencaoGzoxRecordBuilder toBuilder() =>
      new ManutencaoGzoxRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ManutencaoGzoxRecord &&
        codigoDoProduto == other.codigoDoProduto &&
        dataDaManutencao == other.dataDaManutencao &&
        produtosSecundarios == other.produtosSecundarios &&
        fotoDaManutencao == other.fotoDaManutencao &&
        aplicadorCredenciado == other.aplicadorCredenciado &&
        oQueFoiFeito == other.oQueFoiFeito &&
        placa == other.placa &&
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
                            $jc($jc(0, codigoDoProduto.hashCode),
                                dataDaManutencao.hashCode),
                            produtosSecundarios.hashCode),
                        fotoDaManutencao.hashCode),
                    aplicadorCredenciado.hashCode),
                oQueFoiFeito.hashCode),
            placa.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ManutencaoGzoxRecord')
          ..add('codigoDoProduto', codigoDoProduto)
          ..add('dataDaManutencao', dataDaManutencao)
          ..add('produtosSecundarios', produtosSecundarios)
          ..add('fotoDaManutencao', fotoDaManutencao)
          ..add('aplicadorCredenciado', aplicadorCredenciado)
          ..add('oQueFoiFeito', oQueFoiFeito)
          ..add('placa', placa)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ManutencaoGzoxRecordBuilder
    implements Builder<ManutencaoGzoxRecord, ManutencaoGzoxRecordBuilder> {
  _$ManutencaoGzoxRecord? _$v;

  String? _codigoDoProduto;
  String? get codigoDoProduto => _$this._codigoDoProduto;
  set codigoDoProduto(String? codigoDoProduto) =>
      _$this._codigoDoProduto = codigoDoProduto;

  DateTime? _dataDaManutencao;
  DateTime? get dataDaManutencao => _$this._dataDaManutencao;
  set dataDaManutencao(DateTime? dataDaManutencao) =>
      _$this._dataDaManutencao = dataDaManutencao;

  String? _produtosSecundarios;
  String? get produtosSecundarios => _$this._produtosSecundarios;
  set produtosSecundarios(String? produtosSecundarios) =>
      _$this._produtosSecundarios = produtosSecundarios;

  String? _fotoDaManutencao;
  String? get fotoDaManutencao => _$this._fotoDaManutencao;
  set fotoDaManutencao(String? fotoDaManutencao) =>
      _$this._fotoDaManutencao = fotoDaManutencao;

  String? _aplicadorCredenciado;
  String? get aplicadorCredenciado => _$this._aplicadorCredenciado;
  set aplicadorCredenciado(String? aplicadorCredenciado) =>
      _$this._aplicadorCredenciado = aplicadorCredenciado;

  String? _oQueFoiFeito;
  String? get oQueFoiFeito => _$this._oQueFoiFeito;
  set oQueFoiFeito(String? oQueFoiFeito) => _$this._oQueFoiFeito = oQueFoiFeito;

  String? _placa;
  String? get placa => _$this._placa;
  set placa(String? placa) => _$this._placa = placa;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ManutencaoGzoxRecordBuilder() {
    ManutencaoGzoxRecord._initializeBuilder(this);
  }

  ManutencaoGzoxRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _codigoDoProduto = $v.codigoDoProduto;
      _dataDaManutencao = $v.dataDaManutencao;
      _produtosSecundarios = $v.produtosSecundarios;
      _fotoDaManutencao = $v.fotoDaManutencao;
      _aplicadorCredenciado = $v.aplicadorCredenciado;
      _oQueFoiFeito = $v.oQueFoiFeito;
      _placa = $v.placa;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ManutencaoGzoxRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ManutencaoGzoxRecord;
  }

  @override
  void update(void Function(ManutencaoGzoxRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ManutencaoGzoxRecord build() => _build();

  _$ManutencaoGzoxRecord _build() {
    final _$result = _$v ??
        new _$ManutencaoGzoxRecord._(
            codigoDoProduto: codigoDoProduto,
            dataDaManutencao: dataDaManutencao,
            produtosSecundarios: produtosSecundarios,
            fotoDaManutencao: fotoDaManutencao,
            aplicadorCredenciado: aplicadorCredenciado,
            oQueFoiFeito: oQueFoiFeito,
            placa: placa,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
