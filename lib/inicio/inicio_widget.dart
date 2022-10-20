import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class InicioWidget extends StatefulWidget {
  const InicioWidget({Key? key}) : super(key: key);

  @override
  _InicioWidgetState createState() => _InicioWidgetState();
}

class _InicioWidgetState extends State<InicioWidget> {
  TextEditingController? textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF20222C),
      appBar: AppBar(
        backgroundColor: Color(0xFF1A1B24),
        automaticallyImplyLeading: false,
        title: Image.asset(
          'assets/images/gzox_system_logo.png',
          width: 300,
          height: 34,
          fit: BoxFit.cover,
        ),
        actions: [
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.login,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30,
            ),
            onPressed: () async {
              context.pushNamed('AREA_PRIVADA');
            },
          ),
        ],
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 320,
                    decoration: BoxDecoration(
                      color: Color(0xFF1A1B24),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: Color(0x27000000),
                          offset: Offset(0, 3),
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/car_gzox.webp',
                          width: 320,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          'Insira o código de autenticidade \nou os dados veículo para localizar.',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                          child: TextFormField(
                            controller: textController,
                            onChanged: (_) => EasyDebounce.debounce(
                              'textController',
                              Duration(milliseconds: 2000),
                              () => setState(() {}),
                            ),
                            onFieldSubmitted: (_) async {
                              await Future.delayed(
                                  const Duration(milliseconds: 1000));
                            },
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Localizar veículo...',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              filled: true,
                              fillColor: Color(0xFF262D34),
                              prefixIcon: Icon(
                                Icons.search_rounded,
                                color: Colors.white,
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyText1,
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            StreamBuilder<List<VeiculoRecord>>(
              stream: queryVeiculoRecord(
                queryBuilder: (veiculoRecord) => veiculoRecord.where('Placa',
                    isEqualTo: textController!.text),
                limit: 1,
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: SpinKitChasingDots(
                        color: FlutterFlowTheme.of(context).primaryColor,
                        size: 50,
                      ),
                    ),
                  );
                }
                List<VeiculoRecord> listViewVeiculoRecordList = snapshot.data!;
                if (listViewVeiculoRecordList.isEmpty) {
                  return Image.asset(
                    'assets/images/undraw_preferences_popup_re_4qk0_copiar.webp',
                    width: MediaQuery.of(context).size.width * 0.88,
                    height: 188,
                  );
                }
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: listViewVeiculoRecordList.length,
                  itemBuilder: (context, listViewIndex) {
                    final listViewVeiculoRecord =
                        listViewVeiculoRecordList[listViewIndex];
                    return Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                      child: InkWell(
                        onTap: () async {
                          context.pushNamed(
                            'Detalhes_da_aplicacao',
                            queryParams: {
                              'placa': serializeParam(
                                listViewVeiculoRecord.placa,
                                ParamType.String,
                              ),
                              'marca': serializeParam(
                                listViewVeiculoRecord.marca,
                                ParamType.String,
                              ),
                              'modelo': serializeParam(
                                listViewVeiculoRecord.modelo,
                                ParamType.String,
                              ),
                              'quilometragem': serializeParam(
                                listViewVeiculoRecord.quilometragem,
                                ParamType.String,
                              ),
                              'nome': serializeParam(
                                listViewVeiculoRecord.nomeDoDonoGzox,
                                ParamType.String,
                              ),
                              'email': serializeParam(
                                listViewVeiculoRecord.emailDoDonoGzox,
                                ParamType.String,
                              ),
                              'whatsapp': serializeParam(
                                listViewVeiculoRecord.whatsappDoDonoGzox,
                                ParamType.String,
                              ),
                              'tipo': serializeParam(
                                listViewVeiculoRecord.tipoDeVeiculo,
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xFF0F1316),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 7,
                                color: Color(0x2F1D2429),
                                offset: Offset(0, 3),
                              )
                            ],
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Color(0xFFFF4900),
                            ),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                StreamBuilder<List<AplicacaoGzoxRecord>>(
                                  stream: queryAplicacaoGzoxRecord(
                                    queryBuilder: (aplicacaoGzoxRecord) =>
                                        aplicacaoGzoxRecord.where('placa',
                                            isEqualTo:
                                                listViewVeiculoRecord.placa),
                                    singleRecord: true,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: SpinKitChasingDots(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            size: 50,
                                          ),
                                        ),
                                      );
                                    }
                                    List<AplicacaoGzoxRecord>
                                        imageAplicacaoGzoxRecordList =
                                        snapshot.data!;
                                    // Return an empty Container when the document does not exist.
                                    if (snapshot.data!.isEmpty) {
                                      return Container();
                                    }
                                    final imageAplicacaoGzoxRecord =
                                        imageAplicacaoGzoxRecordList.isNotEmpty
                                            ? imageAplicacaoGzoxRecordList.first
                                            : null;
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        imageAplicacaoGzoxRecord!.fotografia!,
                                        width: double.infinity,
                                        height: 140,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  },
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        listViewVeiculoRecord.placa!,
                                        style: FlutterFlowTheme.of(context)
                                            .title3
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 10, 0),
                                        child: Text(
                                          'Marca',
                                          textAlign: TextAlign.end,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF57636C),
                                                fontSize: 17,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: Text(
                                          'Modelo',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF57636C),
                                                fontSize: 17,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 4, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 10, 0),
                                          child: Text(
                                            listViewVeiculoRecord.marca!,
                                            textAlign: TextAlign.end,
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle2
                                                .override(
                                                  fontFamily: 'Roboto Mono',
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 0, 0),
                                          child: Text(
                                            listViewVeiculoRecord.modelo!,
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle2
                                                .override(
                                                  fontFamily: 'Roboto Mono',
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
