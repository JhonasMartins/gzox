// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dados_do_aplicador_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DadosDoAplicadorRecord> _$dadosDoAplicadorRecordSerializer =
    new _$DadosDoAplicadorRecordSerializer();

class _$DadosDoAplicadorRecordSerializer
    implements StructuredSerializer<DadosDoAplicadorRecord> {
  @override
  final Iterable<Type> types = const [
    DadosDoAplicadorRecord,
    _$DadosDoAplicadorRecord
  ];
  @override
  final String wireName = 'DadosDoAplicadorRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, DadosDoAplicadorRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.nomeDoAplicador;
    if (value != null) {
      result
        ..add('Nome_do_aplicador')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.whatsappDoAplicador;
    if (value != null) {
      result
        ..add('Whatsapp_do_aplicador')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.fotoDoAplicador;
    if (value != null) {
      result
        ..add('Foto_do_aplicador')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
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
  DadosDoAplicadorRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DadosDoAplicadorRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'Nome_do_aplicador':
          result.nomeDoAplicador = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Whatsapp_do_aplicador':
          result.whatsappDoAplicador = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Foto_do_aplicador':
          result.fotoDoAplicador = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
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

class _$DadosDoAplicadorRecord extends DadosDoAplicadorRecord {
  @override
  final String? nomeDoAplicador;
  @override
  final String? whatsappDoAplicador;
  @override
  final String? fotoDoAplicador;
  @override
  final DocumentReference<Object?>? user;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$DadosDoAplicadorRecord(
          [void Function(DadosDoAplicadorRecordBuilder)? updates]) =>
      (new DadosDoAplicadorRecordBuilder()..update(updates))._build();

  _$DadosDoAplicadorRecord._(
      {this.nomeDoAplicador,
      this.whatsappDoAplicador,
      this.fotoDoAplicador,
      this.user,
      this.ffRef})
      : super._();

  @override
  DadosDoAplicadorRecord rebuild(
          void Function(DadosDoAplicadorRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DadosDoAplicadorRecordBuilder toBuilder() =>
      new DadosDoAplicadorRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DadosDoAplicadorRecord &&
        nomeDoAplicador == other.nomeDoAplicador &&
        whatsappDoAplicador == other.whatsappDoAplicador &&
        fotoDoAplicador == other.fotoDoAplicador &&
        user == other.user &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc(0, nomeDoAplicador.hashCode),
                    whatsappDoAplicador.hashCode),
                fotoDoAplicador.hashCode),
            user.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DadosDoAplicadorRecord')
          ..add('nomeDoAplicador', nomeDoAplicador)
          ..add('whatsappDoAplicador', whatsappDoAplicador)
          ..add('fotoDoAplicador', fotoDoAplicador)
          ..add('user', user)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class DadosDoAplicadorRecordBuilder
    implements Builder<DadosDoAplicadorRecord, DadosDoAplicadorRecordBuilder> {
  _$DadosDoAplicadorRecord? _$v;

  String? _nomeDoAplicador;
  String? get nomeDoAplicador => _$this._nomeDoAplicador;
  set nomeDoAplicador(String? nomeDoAplicador) =>
      _$this._nomeDoAplicador = nomeDoAplicador;

  String? _whatsappDoAplicador;
  String? get whatsappDoAplicador => _$this._whatsappDoAplicador;
  set whatsappDoAplicador(String? whatsappDoAplicador) =>
      _$this._whatsappDoAplicador = whatsappDoAplicador;

  String? _fotoDoAplicador;
  String? get fotoDoAplicador => _$this._fotoDoAplicador;
  set fotoDoAplicador(String? fotoDoAplicador) =>
      _$this._fotoDoAplicador = fotoDoAplicador;

  DocumentReference<Object?>? _user;
  DocumentReference<Object?>? get user => _$this._user;
  set user(DocumentReference<Object?>? user) => _$this._user = user;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  DadosDoAplicadorRecordBuilder() {
    DadosDoAplicadorRecord._initializeBuilder(this);
  }

  DadosDoAplicadorRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _nomeDoAplicador = $v.nomeDoAplicador;
      _whatsappDoAplicador = $v.whatsappDoAplicador;
      _fotoDoAplicador = $v.fotoDoAplicador;
      _user = $v.user;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DadosDoAplicadorRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DadosDoAplicadorRecord;
  }

  @override
  void update(void Function(DadosDoAplicadorRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DadosDoAplicadorRecord build() => _build();

  _$DadosDoAplicadorRecord _build() {
    final _$result = _$v ??
        new _$DadosDoAplicadorRecord._(
            nomeDoAplicador: nomeDoAplicador,
            whatsappDoAplicador: whatsappDoAplicador,
            fotoDoAplicador: fotoDoAplicador,
            user: user,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
