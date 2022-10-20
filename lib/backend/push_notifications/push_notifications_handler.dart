import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final pageBuilder = pageBuilderMap[initialPageName];
      if (pageBuilder != null) {
        final page = await pageBuilder(initialParameterData);
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Color(0xFF1A1B24),
          child: Center(
            child: Image.asset(
              'assets/images/logo_sem_fundo.png',
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
        )
      : widget.child;
}

final pageBuilderMap = <String, Future<Widget> Function(Map<String, dynamic>)>{
  'Inicio': (data) async => InicioWidget(),
  'AREA_PRIVADA': (data) async => AreaPrivadaWidget(),
  'CADASTRAR': (data) async => CadastrarWidget(),
  'LOGIN': (data) async => LoginWidget(),
  'Cadastrar_veiculo': (data) async => CadastrarVeiculoWidget(),
  'Cadastrar_o_produto': (data) async => CadastrarOProdutoWidget(
        placa: getParameter(data, 'placa'),
        whatsapp: getParameter(data, 'whatsapp'),
        email: getParameter(data, 'email'),
        quilometragem: getParameter(data, 'quilometragem'),
        marca: getParameter(data, 'marca'),
        modelo: getParameter(data, 'modelo'),
        tipo: getParameter(data, 'tipo'),
        user: getParameter(data, 'user'),
        nome: getParameter(data, 'nome'),
      ),
  'sucesso': (data) async => SucessoWidget(),
  'Servicos_realizados': (data) async => ServicosRealizadosWidget(),
  'Alterar_dados_do_proprietario': (data) async =>
      AlterarDadosDoProprietarioWidget(),
  'Perfil': (data) async => PerfilWidget(),
  'editarperfil': (data) async => EditarperfilWidget(),
  'Detalhes_da_aplicacao': (data) async => DetalhesDaAplicacaoWidget(
        placa: getParameter(data, 'placa'),
        marca: getParameter(data, 'marca'),
        modelo: getParameter(data, 'modelo'),
        quilometragem: getParameter(data, 'quilometragem'),
        nome: getParameter(data, 'nome'),
        email: getParameter(data, 'email'),
        whatsapp: getParameter(data, 'whatsapp'),
        tipo: getParameter(data, 'tipo'),
      ),
  'Notificacoes': (data) async => NotificacoesWidget(),
  'Cliente_detalhe': (data) async => ClienteDetalheWidget(
        cliente: getParameter(data, 'cliente'),
        cliente2: getParameter(data, 'cliente2'),
        cliente3: getParameter(data, 'cliente3'),
        placa: getParameter(data, 'placa'),
      ),
  'manutencao': (data) async => ManutencaoWidget(
        placa: getParameter(data, 'placa'),
        whatsapp: getParameter(data, 'whatsapp'),
        email: getParameter(data, 'email'),
        quilometragem: getParameter(data, 'quilometragem'),
        marca: getParameter(data, 'marca'),
        modelo: getParameter(data, 'modelo'),
        tipo: getParameter(data, 'tipo'),
        user: getParameter(data, 'user'),
        nome: getParameter(data, 'nome'),
      ),
  'Solicitar_codigo': (data) async => SolicitarCodigoWidget(),
  'retorno': (data) async => RetornoWidget(),
  'Redefinirsenha': (data) async => RedefinirsenhaWidget(),
  'Nova_aplicacao': (data) async => NovaAplicacaoWidget(
        placa: getParameter(data, 'placa'),
        whatsapp: getParameter(data, 'whatsapp'),
        email: getParameter(data, 'email'),
        quilometragem: getParameter(data, 'quilometragem'),
        marca: getParameter(data, 'marca'),
        modelo: getParameter(data, 'modelo'),
        tipo: getParameter(data, 'tipo'),
        user: getParameter(data, 'user'),
        nome: getParameter(data, 'nome'),
      ),
  'mapa': (data) async => MapaWidget(
        cities:
            await getDocumentParameter(data, 'cities', MapasRecord.serializer),
      ),
};

bool hasMatchingParameters(Map<String, dynamic> data, Set<String> params) =>
    params.any((param) => getParameter(data, param) != null);

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
