import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class XanoCall {
  static Future<ApiCallResponse> call({
    String? whatsapp = '',
    String? nome = '',
    String? email = '',
  }) {
    final body = '''
{
  "whatsapp_numero": "${whatsapp}",
  "nome": "${nome}",
  "email": "${email}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Xano',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:p3HikNZx/whatsapp',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class EnviarMensagemCall {
  static Future<ApiCallResponse> call({
    String? nome = '',
    String? whatsapp = '',
    String? mensagem = '',
  }) {
    final body = '''
{
  "phone": "${whatsapp}",
  "message": "${nome}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Enviar mensagem',
      apiUrl:
          'https://api.z-api.io/instances/3B06FDC7049EB007D10CE23BBED8D15C/token/B324A8D2123A130F8BF2844B/send-messages',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class EnviarFotoCall {
  static Future<ApiCallResponse> call({
    String? imagem = '',
    String? whatsapp = '',
  }) {
    final body = '''
{
  "phone": "${whatsapp}",
  "image": "${imagem}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Enviar foto',
      apiUrl:
          'https://api.z-api.io/instances/3B06FDC7049EB007D10CE23BBED8D15C/token/B324A8D2123A130F8BF2844B/send-messages',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class ContatoCall {
  static Future<ApiCallResponse> call({
    String? whatsappParaEnviar = '',
    String? nomeDoContato = '',
    String? whatsappDoAplicador = '',
  }) {
    final body = '''
{
  "phone": "${whatsappParaEnviar}",
  "contactName": "${nomeDoContato}",
  "contactPhone": "${whatsappDoAplicador}",
  "contactBusinessDescription": "Segue o contato do aplicador credenciado"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'contato',
      apiUrl:
          'https://api.z-api.io/instances/3B06FDC7049EB007D10CE23BBED8D15C/token/B324A8D2123A130F8BF2844B/send-messages',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}
