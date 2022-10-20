// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mapas_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MapasRecord> _$mapasRecordSerializer = new _$MapasRecordSerializer();

class _$MapasRecordSerializer implements StructuredSerializer<MapasRecord> {
  @override
  final Iterable<Type> types = const [MapasRecord, _$MapasRecord];
  @override
  final String wireName = 'MapasRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, MapasRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.latitudeLogitude;
    if (value != null) {
      result
        ..add('latitude_logitude')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.rua;
    if (value != null) {
      result
        ..add('Rua')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bairro;
    if (value != null) {
      result
        ..add('bairro')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.cidade;
    if (value != null) {
      result
        ..add('cidade')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.estado;
    if (value != null) {
      result
        ..add('estado')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pais;
    if (value != null) {
      result
        ..add('pais')
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
    value = object.nomeDaEstetica;
    if (value != null) {
      result
        ..add('Nome_da_estetica')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.whatsapp;
    if (value != null) {
      result
        ..add('whatsapp')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.foto;
    if (value != null) {
      result
        ..add('foto')
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
  MapasRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MapasRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'latitude_logitude':
          result.latitudeLogitude = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'Rua':
          result.rua = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'bairro':
          result.bairro = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'cidade':
          result.cidade = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'estado':
          result.estado = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'pais':
          result.pais = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'Nome_da_estetica':
          result.nomeDaEstetica = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'whatsapp':
          result.whatsapp = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'foto':
          result.foto = serializers.deserialize(value,
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

class _$MapasRecord extends MapasRecord {
  @override
  final LatLng? latitudeLogitude;
  @override
  final String? rua;
  @override
  final String? bairro;
  @override
  final String? cidade;
  @override
  final String? estado;
  @override
  final String? pais;
  @override
  final DocumentReference<Object?>? user;
  @override
  final String? nomeDaEstetica;
  @override
  final String? whatsapp;
  @override
  final String? email;
  @override
  final String? foto;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$MapasRecord([void Function(MapasRecordBuilder)? updates]) =>
      (new MapasRecordBuilder()..update(updates))._build();

  _$MapasRecord._(
      {this.latitudeLogitude,
      this.rua,
      this.bairro,
      this.cidade,
      this.estado,
      this.pais,
      this.user,
      this.nomeDaEstetica,
      this.whatsapp,
      this.email,
      this.foto,
      this.ffRef})
      : super._();

  @override
  MapasRecord rebuild(void Function(MapasRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MapasRecordBuilder toBuilder() => new MapasRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MapasRecord &&
        latitudeLogitude == other.latitudeLogitude &&
        rua == other.rua &&
        bairro == other.bairro &&
        cidade == other.cidade &&
        estado == other.estado &&
        pais == other.pais &&
        user == other.user &&
        nomeDaEstetica == other.nomeDaEstetica &&
        whatsapp == other.whatsapp &&
        email == other.email &&
        foto == other.foto &&
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
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(0,
                                                    latitudeLogitude.hashCode),
                                                rua.hashCode),
                                            bairro.hashCode),
                                        cidade.hashCode),
                                    estado.hashCode),
                                pais.hashCode),
                            user.hashCode),
                        nomeDaEstetica.hashCode),
                    whatsapp.hashCode),
                email.hashCode),
            foto.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MapasRecord')
          ..add('latitudeLogitude', latitudeLogitude)
          ..add('rua', rua)
          ..add('bairro', bairro)
          ..add('cidade', cidade)
          ..add('estado', estado)
          ..add('pais', pais)
          ..add('user', user)
          ..add('nomeDaEstetica', nomeDaEstetica)
          ..add('whatsapp', whatsapp)
          ..add('email', email)
          ..add('foto', foto)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class MapasRecordBuilder implements Builder<MapasRecord, MapasRecordBuilder> {
  _$MapasRecord? _$v;

  LatLng? _latitudeLogitude;
  LatLng? get latitudeLogitude => _$this._latitudeLogitude;
  set latitudeLogitude(LatLng? latitudeLogitude) =>
      _$this._latitudeLogitude = latitudeLogitude;

  String? _rua;
  String? get rua => _$this._rua;
  set rua(String? rua) => _$this._rua = rua;

  String? _bairro;
  String? get bairro => _$this._bairro;
  set bairro(String? bairro) => _$this._bairro = bairro;

  String? _cidade;
  String? get cidade => _$this._cidade;
  set cidade(String? cidade) => _$this._cidade = cidade;

  String? _estado;
  String? get estado => _$this._estado;
  set estado(String? estado) => _$this._estado = estado;

  String? _pais;
  String? get pais => _$this._pais;
  set pais(String? pais) => _$this._pais = pais;

  DocumentReference<Object?>? _user;
  DocumentReference<Object?>? get user => _$this._user;
  set user(DocumentReference<Object?>? user) => _$this._user = user;

  String? _nomeDaEstetica;
  String? get nomeDaEstetica => _$this._nomeDaEstetica;
  set nomeDaEstetica(String? nomeDaEstetica) =>
      _$this._nomeDaEstetica = nomeDaEstetica;

  String? _whatsapp;
  String? get whatsapp => _$this._whatsapp;
  set whatsapp(String? whatsapp) => _$this._whatsapp = whatsapp;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _foto;
  String? get foto => _$this._foto;
  set foto(String? foto) => _$this._foto = foto;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  MapasRecordBuilder() {
    MapasRecord._initializeBuilder(this);
  }

  MapasRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _latitudeLogitude = $v.latitudeLogitude;
      _rua = $v.rua;
      _bairro = $v.bairro;
      _cidade = $v.cidade;
      _estado = $v.estado;
      _pais = $v.pais;
      _user = $v.user;
      _nomeDaEstetica = $v.nomeDaEstetica;
      _whatsapp = $v.whatsapp;
      _email = $v.email;
      _foto = $v.foto;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MapasRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MapasRecord;
  }

  @override
  void update(void Function(MapasRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MapasRecord build() => _build();

  _$MapasRecord _build() {
    final _$result = _$v ??
        new _$MapasRecord._(
            latitudeLogitude: latitudeLogitude,
            rua: rua,
            bairro: bairro,
            cidade: cidade,
            estado: estado,
            pais: pais,
            user: user,
            nomeDaEstetica: nomeDaEstetica,
            whatsapp: whatsapp,
            email: email,
            foto: foto,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
