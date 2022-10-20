import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    _fotodeperfil =
        await secureStorage.getString('ff_fotodeperfil') ?? _fotodeperfil;
  }

  late FlutterSecureStorage secureStorage;

  List<String> Veiculos = [
    'Moto',
    'Carro',
    'Caminhão',
    'Maquina Agrícola',
    'Embarcação',
    'Aeronave'
  ];

  List<String> Produtos = [
    'Real Glass Coat Class R',
    'Real Glass Coat Class H',
    'Real Glass Coat Class M',
    'Prospec H-9',
    'Hi-mohs Neo',
    'Hi-mohs Glow'
  ];

  List<String> Secundarios = [
    'Prospec 45',
    'Wheel & Chrome Coat',
    'Tire Coat',
    'Light Coat',
    'Nano Plastic',
    'Prospec Couro'
  ];

  String _fotodeperfil = '';
  String get fotodeperfil => _fotodeperfil;
  set fotodeperfil(String _value) {
    _fotodeperfil = _value;
    secureStorage.setString('ff_fotodeperfil', _value);
  }

  void deleteFotodeperfil() {
    secureStorage.delete(key: 'ff_fotodeperfil');
  }

  List<String> MarcaCarro = [
    'Chevrolet',
    'Volskwagen',
    'Fiat',
    'Mercedes-Benz',
    'Citroen',
    'Honda',
    'Subaru',
    'Ferrari',
    'Lamborghini',
    'Ford',
    'Hyundai',
    'Jac',
    'Kia',
    'Dodge',
    'Chrysler',
    'Bentley',
    'Peugeot',
    '\nToyota',
    'Renault',
    'Aston Martin',
    'Audi',
    'BMW',
    'Nissan',
    'Chery',
    'Volvo',
    'Suzuki',
    'Porsche',
    'Jaguar',
    'Jeep',
    'Land Rover',
    'Lexus',
    'Maserati',
    'Mazda',
    'Mini',
    'Mitsubishi',
    'Rolls-Royce',
    'Cadillac',
    'Troller',
    'Outro'
  ];

  List<String> ModeloCarro = [];

  List<String> ProdutosManutencao = [
    'Repel Boost',
    'Seeting Boost',
    'Hi-mohs Neo Maintenance',
    'Hi-mohs Glow Maintenance'
  ];

  List<String> outros = ['teste'];
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await write(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await write(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await write(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await write(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await write(key: key, value: ListToCsvConverter().convert([value]));
}
