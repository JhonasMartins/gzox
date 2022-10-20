import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '../flutter_flow_theme.dart';
import '../../backend/backend.dart';
import '../../auth/firebase_user_provider.dart';
import '../../backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;

import '../../index.dart';
import '../../main.dart';
import '../lat_lng.dart';
import '../place.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  GzoxSystemFirebaseUser? initialUser;
  GzoxSystemFirebaseUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(GzoxSystemFirebaseUser newUser) {
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    if (notifyOnAuthChange) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, _) =>
          appStateNotifier.loggedIn ? PainelWidget() : InicioWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? PainelWidget() : InicioWidget(),
          routes: [
            FFRoute(
              name: 'Inicio',
              path: 'inicio',
              builder: (context, params) => InicioWidget(),
            ),
            FFRoute(
              name: 'AREA_PRIVADA',
              path: 'areaPrivada',
              builder: (context, params) => AreaPrivadaWidget(),
            ),
            FFRoute(
              name: 'CADASTRAR',
              path: 'cadastrar',
              builder: (context, params) => CadastrarWidget(),
            ),
            FFRoute(
              name: 'LOGIN',
              path: 'login',
              builder: (context, params) => LoginWidget(),
            ),
            FFRoute(
              name: 'PAINEL',
              path: 'painel',
              builder: (context, params) => PainelWidget(),
            ),
            FFRoute(
              name: 'Cadastrar_veiculo',
              path: 'cadastrar_veiculo',
              builder: (context, params) => CadastrarVeiculoWidget(),
            ),
            FFRoute(
              name: 'Cadastrar_o_produto',
              path: 'cadastrarOProduto',
              builder: (context, params) => CadastrarOProdutoWidget(
                placa: params.getParam('placa', ParamType.String),
                whatsapp: params.getParam('whatsapp', ParamType.String),
                email: params.getParam('email', ParamType.String),
                quilometragem:
                    params.getParam('quilometragem', ParamType.String),
                marca: params.getParam('marca', ParamType.String),
                modelo: params.getParam('modelo', ParamType.String),
                tipo: params.getParam('tipo', ParamType.String),
                user: params.getParam(
                    'user', ParamType.DocumentReference, false, 'user'),
                nome: params.getParam('nome', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'sucesso',
              path: 'sucesso',
              builder: (context, params) => SucessoWidget(),
            ),
            FFRoute(
              name: 'Servicos_realizados',
              path: 'servicosRealizados',
              builder: (context, params) => ServicosRealizadosWidget(),
            ),
            FFRoute(
              name: 'Alterar_dados_do_proprietario',
              path: 'alterarDadosDoProprietario',
              builder: (context, params) => AlterarDadosDoProprietarioWidget(),
            ),
            FFRoute(
              name: 'Perfil',
              path: 'perfil',
              builder: (context, params) => PerfilWidget(),
            ),
            FFRoute(
              name: 'editarperfil',
              path: 'editarperfil',
              builder: (context, params) => EditarperfilWidget(),
            ),
            FFRoute(
              name: 'Detalhes_da_aplicacao',
              path: 'detalhesDaAplicacao',
              builder: (context, params) => DetalhesDaAplicacaoWidget(
                placa: params.getParam('placa', ParamType.String),
                marca: params.getParam('marca', ParamType.String),
                modelo: params.getParam('modelo', ParamType.String),
                quilometragem:
                    params.getParam('quilometragem', ParamType.String),
                nome: params.getParam('nome', ParamType.String),
                email: params.getParam('email', ParamType.String),
                whatsapp: params.getParam('whatsapp', ParamType.String),
                tipo: params.getParam('tipo', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'Notificacoes',
              path: 'notificacoes',
              builder: (context, params) => NotificacoesWidget(),
            ),
            FFRoute(
              name: 'Cliente_detalhe',
              path: 'cliente_detalhe',
              builder: (context, params) => ClienteDetalheWidget(
                cliente: params.getParam(
                    'cliente', ParamType.DocumentReference, false, 'veiculo'),
                cliente2: params.getParam('cliente2',
                    ParamType.DocumentReference, false, 'Manutencao_gzox'),
                cliente3: params.getParam('cliente3',
                    ParamType.DocumentReference, false, 'Aplicacao_gzox'),
                placa: params.getParam('placa', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'manutencao',
              path: 'manutencao',
              builder: (context, params) => ManutencaoWidget(
                placa: params.getParam('placa', ParamType.String),
                whatsapp: params.getParam('whatsapp', ParamType.String),
                email: params.getParam('email', ParamType.String),
                quilometragem:
                    params.getParam('quilometragem', ParamType.String),
                marca: params.getParam('marca', ParamType.String),
                modelo: params.getParam('modelo', ParamType.String),
                tipo: params.getParam('tipo', ParamType.String),
                user: params.getParam(
                    'user', ParamType.DocumentReference, false, 'user'),
                nome: params.getParam('nome', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'Solicitar_codigo',
              path: 'Solicitar_codigo',
              builder: (context, params) => SolicitarCodigoWidget(),
            ),
            FFRoute(
              name: 'retorno',
              path: 'retorno',
              builder: (context, params) => RetornoWidget(),
            ),
            FFRoute(
              name: 'Redefinirsenha',
              path: 'Redefinir_a_senha',
              builder: (context, params) => RedefinirsenhaWidget(),
            ),
            FFRoute(
              name: 'Nova_aplicacao',
              path: 'novaAplicacao',
              builder: (context, params) => NovaAplicacaoWidget(
                placa: params.getParam('placa', ParamType.String),
                whatsapp: params.getParam('whatsapp', ParamType.String),
                email: params.getParam('email', ParamType.String),
                quilometragem:
                    params.getParam('quilometragem', ParamType.String),
                marca: params.getParam('marca', ParamType.String),
                modelo: params.getParam('modelo', ParamType.String),
                tipo: params.getParam('tipo', ParamType.String),
                user: params.getParam(
                    'user', ParamType.DocumentReference, false, 'user'),
                nome: params.getParam('nome', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'mapa',
              path: 'mapa',
              asyncParams: {
                'cities': getDoc('mapas', MapasRecord.serializer),
              },
              builder: (context, params) => MapaWidget(
                cities: params.getParam('cities', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'fdsf',
              path: 'fdsf',
              builder: (context, params) => FdsfWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ).toRoute(appStateNotifier),
      ],
      urlPathStrategy: UrlPathStrategy.path,
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState =>
      (routerDelegate.refreshListenable as AppStateNotifier);
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void setRedirectLocationIfUnset(String location) =>
      (routerDelegate.refreshListenable as AppStateNotifier)
          .updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(params)
    ..addAll(queryParams)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    String? collectionName,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList, collectionName);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/inicio';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
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
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}
