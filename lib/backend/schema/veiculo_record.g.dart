// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'veiculo_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<VeiculoRecord> _$veiculoRecordSerializer =
    new _$VeiculoRecordSerializer();

class _$VeiculoRecordSerializer implements StructuredSerializer<VeiculoRecord> {
  @override
  final Iterable<Type> types = const [VeiculoRecord, _$VeiculoRecord];
  @override
  final String wireName = 'VeiculoRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, VeiculoRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.tipoDeVeiculo;
    if (value != null) {
      result
        ..add('Tipo_de_veiculo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.marca;
    if (value != null) {
      result
        ..add('Marca')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.modelo;
    if (value != null) {
      result
        ..add('Modelo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.quilometragem;
    if (value != null) {
      result
        ..add('Quilometragem')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.emailDoDonoGzox;
    if (value != null) {
      result
        ..add('Email_do_dono_gzox')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nomeDoDonoGzox;
    if (value != null) {
      result
        ..add('Nome_do_dono_gzox')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.whatsappDoDonoGzox;
    if (value != null) {
      result
        ..add('Whatsapp_do_dono_gzox')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.placa;
    if (value != null) {
      result
        ..add('Placa')
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
  VeiculoRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VeiculoRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'Tipo_de_veiculo':
          result.tipoDeVeiculo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Marca':
          result.marca = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Modelo':
          result.modelo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Quilometragem':
          result.quilometragem = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Email_do_dono_gzox':
          result.emailDoDonoGzox = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Nome_do_dono_gzox':
          result.nomeDoDonoGzox = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Whatsapp_do_dono_gzox':
          result.whatsappDoDonoGzox = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Placa':
          result.placa = serializers.deserialize(value,
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

class _$VeiculoRecord extends VeiculoRecord {
  @override
  final String? tipoDeVeiculo;
  @override
  final String? marca;
  @override
  final String? modelo;
  @override
  final String? quilometragem;
  @override
  final String? emailDoDonoGzox;
  @override
  final String? nomeDoDonoGzox;
  @override
  final String? whatsappDoDonoGzox;
  @override
  final String? placa;
  @override
  final DocumentReference<Object?>? user;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$VeiculoRecord([void Function(VeiculoRecordBuilder)? updates]) =>
      (new VeiculoRecordBuilder()..update(updates))._build();

  _$VeiculoRecord._(
      {this.tipoDeVeiculo,
      this.marca,
      this.modelo,
      this.quilometragem,
      this.emailDoDonoGzox,
      this.nomeDoDonoGzox,
      this.whatsappDoDonoGzox,
      this.placa,
      this.user,
      this.ffRef})
      : super._();

  @override
  VeiculoRecord rebuild(void Function(VeiculoRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VeiculoRecordBuilder toBuilder() => new VeiculoRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VeiculoRecord &&
        tipoDeVeiculo == other.tipoDeVeiculo &&
        marca == other.marca &&
        modelo == other.modelo &&
        quilometragem == other.quilometragem &&
        emailDoDonoGzox == other.emailDoDonoGzox &&
        nomeDoDonoGzox == other.nomeDoDonoGzox &&
        whatsappDoDonoGzox == other.whatsappDoDonoGzox &&
        placa == other.placa &&
        user == other.user &&
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
                                    $jc($jc(0, tipoDeVeiculo.hashCode),
                                        marca.hashCode),
                                    modelo.hashCode),
                                quilometragem.hashCode),
                            emailDoDonoGzox.hashCode),
                        nomeDoDonoGzox.hashCode),
                    whatsappDoDonoGzox.hashCode),
                placa.hashCode),
            user.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VeiculoRecord')
          ..add('tipoDeVeiculo', tipoDeVeiculo)
          ..add('marca', marca)
          ..add('modelo', modelo)
          ..add('quilometragem', quilometragem)
          ..add('emailDoDonoGzox', emailDoDonoGzox)
          ..add('nomeDoDonoGzox', nomeDoDonoGzox)
          ..add('whatsappDoDonoGzox', whatsappDoDonoGzox)
          ..add('placa', placa)
          ..add('user', user)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class VeiculoRecordBuilder
    implements Builder<VeiculoRecord, VeiculoRecordBuilder> {
  _$VeiculoRecord? _$v;

  String? _tipoDeVeiculo;
  String? get tipoDeVeiculo => _$this._tipoDeVeiculo;
  set tipoDeVeiculo(String? tipoDeVeiculo) =>
      _$this._tipoDeVeiculo = tipoDeVeiculo;

  String? _marca;
  String? get marca => _$this._marca;
  set marca(String? marca) => _$this._marca = marca;

  String? _modelo;
  String? get modelo => _$this._modelo;
  set modelo(String? modelo) => _$this._modelo = modelo;

  String? _quilometragem;
  String? get quilometragem => _$this._quilometragem;
  set quilometragem(String? quilometragem) =>
      _$this._quilometragem = quilometragem;

  String? _emailDoDonoGzox;
  String? get emailDoDonoGzox => _$this._emailDoDonoGzox;
  set emailDoDonoGzox(String? emailDoDonoGzox) =>
      _$this._emailDoDonoGzox = emailDoDonoGzox;

  String? _nomeDoDonoGzox;
  String? get nomeDoDonoGzox => _$this._nomeDoDonoGzox;
  set nomeDoDonoGzox(String? nomeDoDonoGzox) =>
      _$this._nomeDoDonoGzox = nomeDoDonoGzox;

  String? _whatsappDoDonoGzox;
  String? get whatsappDoDonoGzox => _$this._whatsappDoDonoGzox;
  set whatsappDoDonoGzox(String? whatsappDoDonoGzox) =>
      _$this._whatsappDoDonoGzox = whatsappDoDonoGzox;

  String? _placa;
  String? get placa => _$this._placa;
  set placa(String? placa) => _$this._placa = placa;

  DocumentReference<Object?>? _user;
  DocumentReference<Object?>? get user => _$this._user;
  set user(DocumentReference<Object?>? user) => _$this._user = user;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  VeiculoRecordBuilder() {
    VeiculoRecord._initializeBuilder(this);
  }

  VeiculoRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _tipoDeVeiculo = $v.tipoDeVeiculo;
      _marca = $v.marca;
      _modelo = $v.modelo;
      _quilometragem = $v.quilometragem;
      _emailDoDonoGzox = $v.emailDoDonoGzox;
      _nomeDoDonoGzox = $v.nomeDoDonoGzox;
      _whatsappDoDonoGzox = $v.whatsappDoDonoGzox;
      _placa = $v.placa;
      _user = $v.user;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VeiculoRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VeiculoRecord;
  }

  @override
  void update(void Function(VeiculoRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VeiculoRecord build() => _build();

  _$VeiculoRecord _build() {
    final _$result = _$v ??
        new _$VeiculoRecord._(
            tipoDeVeiculo: tipoDeVeiculo,
            marca: marca,
            modelo: modelo,
            quilometragem: quilometragem,
            emailDoDonoGzox: emailDoDonoGzox,
            nomeDoDonoGzox: nomeDoDonoGzox,
            whatsappDoDonoGzox: whatsappDoDonoGzox,
            placa: placa,
            user: user,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
