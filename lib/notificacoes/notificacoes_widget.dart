import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificacoesWidget extends StatefulWidget {
  const NotificacoesWidget({Key? key}) : super(key: key);

  @override
  _NotificacoesWidgetState createState() => _NotificacoesWidgetState();
}

class _NotificacoesWidgetState extends State<NotificacoesWidget> {
  bool? switchListTileValue1;
  bool? switchListTileValue2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF1A1B24),
      appBar: AppBar(
        backgroundColor: Color(0xFF1A1B24),
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 30,
          ),
          onPressed: () async {
            context.pushNamed('Perfil');
          },
        ),
        title: Text(
          'Configurações',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    child: Text(
                      'Escolha abaixo quais notificações você deseja receber e atualizaremos as configurações.',
                      style: FlutterFlowTheme.of(context).bodyText2.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
            child: SwitchListTile.adaptive(
              value: switchListTileValue1 ??= true,
              onChanged: (newValue) async {
                setState(() => switchListTileValue1 = newValue!);
              },
              title: Text(
                'Push de notificações',
                style: FlutterFlowTheme.of(context).title3.override(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.normal,
                    ),
              ),
              subtitle: Text(
                'Receba notificações Push do nosso aplicativo de forma semi-regular.',
                style: FlutterFlowTheme.of(context).bodyText2.override(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.normal,
                    ),
              ),
              activeColor: FlutterFlowTheme.of(context).primaryBtnText,
              activeTrackColor: Color(0xFFFF4D00),
              dense: false,
              controlAffinity: ListTileControlAffinity.trailing,
              contentPadding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 12),
            ),
          ),
          SwitchListTile.adaptive(
            value: switchListTileValue2 ??= true,
            onChanged: (newValue) async {
              setState(() => switchListTileValue2 = newValue!);
            },
            title: Text(
              'Email de Notifications',
              style: FlutterFlowTheme.of(context).title3.override(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.normal,
                  ),
            ),
            subtitle: Text(
              'Receba notificações por e-mail de nossa equipe de marketing sobre novos recursos.',
              style: FlutterFlowTheme.of(context).bodyText2.override(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.normal,
                  ),
            ),
            activeColor: FlutterFlowTheme.of(context).primaryBtnText,
            activeTrackColor: Color(0xFFFF4D00),
            dense: false,
            controlAffinity: ListTileControlAffinity.trailing,
            contentPadding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 12),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
            child: FFButtonWidget(
              onPressed: () async {
                context.pop();
              },
              text: 'Salvar',
              options: FFButtonOptions(
                width: 190,
                height: 50,
                color: FlutterFlowTheme.of(context).primaryColor,
                textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                      fontFamily: 'Lexend Deca',
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                elevation: 3,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
