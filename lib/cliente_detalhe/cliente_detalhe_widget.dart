import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ClienteDetalheWidget extends StatefulWidget {
  const ClienteDetalheWidget({
    Key? key,
    this.cliente,
    this.cliente2,
    this.cliente3,
    this.placa,
  }) : super(key: key);

  final DocumentReference? cliente;
  final DocumentReference? cliente2;
  final DocumentReference? cliente3;
  final String? placa;

  @override
  _ClienteDetalheWidgetState createState() => _ClienteDetalheWidgetState();
}

class _ClienteDetalheWidgetState extends State<ClienteDetalheWidget> {
  TextEditingController? nomeController1;
  TextEditingController? nomeController2;
  TextEditingController? nomeController3;
  TextEditingController? nomeController4;
  TextEditingController? nomeController5;
  TextEditingController? nomeController6;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    nomeController1 = TextEditingController();
    nomeController2 = TextEditingController();
    nomeController3 = TextEditingController();
    nomeController4 = TextEditingController();
    nomeController5 = TextEditingController();
    nomeController6 = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    nomeController1?.dispose();
    nomeController2?.dispose();
    nomeController3?.dispose();
    nomeController4?.dispose();
    nomeController5?.dispose();
    nomeController6?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<VeiculoRecord>(
      stream: VeiculoRecord.getDocument(widget.cliente!),
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
        final clienteDetalheVeiculoRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFF1A1B24),
          appBar: AppBar(
            backgroundColor: Color(0xFF1A1B24),
            automaticallyImplyLeading: true,
            title: Text(
              'Detalhes do veículo',
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                  ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 4,
          ),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                alignment: AlignmentDirectional(0, -1),
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, -1),
                    child: StreamBuilder<List<AplicacaoGzoxRecord>>(
                      stream: queryAplicacaoGzoxRecord(
                        queryBuilder: (aplicacaoGzoxRecord) =>
                            aplicacaoGzoxRecord.where('placa',
                                isEqualTo: clienteDetalheVeiculoRecord.placa),
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
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                size: 50,
                              ),
                            ),
                          );
                        }
                        List<AplicacaoGzoxRecord> imageAplicacaoGzoxRecordList =
                            snapshot.data!;
                        // Return an empty Container when the document does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final imageAplicacaoGzoxRecord =
                            imageAplicacaoGzoxRecordList.isNotEmpty
                                ? imageAplicacaoGzoxRecordList.first
                                : null;
                        return Image.network(
                          imageAplicacaoGzoxRecord!.fotografia!,
                          width: double.infinity,
                          height: 300,
                          fit: BoxFit.contain,
                        );
                      },
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0, 1),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 300, 0, 0),
                            child: Container(
                              width: double.infinity,
                              height: 700,
                              decoration: BoxDecoration(
                                color: Color(0xFF20222C),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x320E151B),
                                    offset: Offset(0, -2),
                                  )
                                ],
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0),
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                ),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24, 0, 24, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          FFButtonWidget(
                                            onPressed: () async {
                                              context.pushNamed(
                                                'manutencao',
                                                queryParams: {
                                                  'placa': serializeParam(
                                                    clienteDetalheVeiculoRecord
                                                        .placa,
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            text: 'Manutenção',
                                            options: FFButtonOptions(
                                              width: 150,
                                              height: 50,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary400,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                              elevation: 2,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                          FFButtonWidget(
                                            onPressed: () async {
                                              context.pushNamed(
                                                'Nova_aplicacao',
                                                queryParams: {
                                                  'placa': serializeParam(
                                                    clienteDetalheVeiculoRecord
                                                        .placa,
                                                    ParamType.String,
                                                  ),
                                                  'whatsapp': serializeParam(
                                                    '',
                                                    ParamType.String,
                                                  ),
                                                  'email': serializeParam(
                                                    clienteDetalheVeiculoRecord
                                                        .emailDoDonoGzox,
                                                    ParamType.String,
                                                  ),
                                                  'quilometragem':
                                                      serializeParam(
                                                    clienteDetalheVeiculoRecord
                                                        .quilometragem,
                                                    ParamType.String,
                                                  ),
                                                  'marca': serializeParam(
                                                    clienteDetalheVeiculoRecord
                                                        .marca,
                                                    ParamType.String,
                                                  ),
                                                  'modelo': serializeParam(
                                                    clienteDetalheVeiculoRecord
                                                        .modelo,
                                                    ParamType.String,
                                                  ),
                                                  'tipo': serializeParam(
                                                    clienteDetalheVeiculoRecord
                                                        .tipoDeVeiculo,
                                                    ParamType.String,
                                                  ),
                                                  'user': serializeParam(
                                                    currentUserReference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                  'nome': serializeParam(
                                                    clienteDetalheVeiculoRecord
                                                        .nomeDoDonoGzox,
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            text: 'Aplicação',
                                            options: FFButtonOptions(
                                              width: 150,
                                              height: 50,
                                              color: Color(0xFFFF4D00),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                              elevation: 2,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24, 5, 24, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          FFButtonWidget(
                                            onPressed: () {
                                              print('Button pressed ...');
                                            },
                                            text: 'E-mail',
                                            options: FFButtonOptions(
                                              width: 150,
                                              height: 50,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .grayIcon,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                              elevation: 2,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                          FFButtonWidget(
                                            onPressed: () async {
                                              await launchURL(
                                                  'https://wa.me/55${clienteDetalheVeiculoRecord.whatsappDoDonoGzox}');
                                            },
                                            text: 'Whatsapp',
                                            options: FFButtonOptions(
                                              width: 150,
                                              height: 50,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .customColor1,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                              elevation: 2,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 16, 16, 0),
                                      child: StreamBuilder<
                                          List<VeiculoSystemRecord>>(
                                        stream: queryVeiculoSystemRecord(
                                          queryBuilder: (veiculoSystemRecord) =>
                                              veiculoSystemRecord.where('Placa',
                                                  isEqualTo:
                                                      clienteDetalheVeiculoRecord
                                                          .placa),
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  size: 50,
                                                ),
                                              ),
                                            );
                                          }
                                          List<VeiculoSystemRecord>
                                              rowVeiculoSystemRecordList =
                                              snapshot.data!;
                                          // Return an empty Container when the document does not exist.
                                          if (snapshot.data!.isEmpty) {
                                            return Container();
                                          }
                                          final rowVeiculoSystemRecord =
                                              rowVeiculoSystemRecordList
                                                      .isNotEmpty
                                                  ? rowVeiculoSystemRecordList
                                                      .first
                                                  : null;
                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 2, 0),
                                                  child: StreamBuilder<
                                                      List<VeiculoRecord>>(
                                                    stream: queryVeiculoRecord(
                                                      queryBuilder:
                                                          (veiculoRecord) =>
                                                              veiculoRecord.where(
                                                                  'Placa',
                                                                  isEqualTo:
                                                                      widget
                                                                          .placa),
                                                      singleRecord: true,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50,
                                                            height: 50,
                                                            child:
                                                                SpinKitChasingDots(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              size: 50,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<VeiculoRecord>
                                                          nomeVeiculoRecordList =
                                                          snapshot.data!;
                                                      // Return an empty Container when the document does not exist.
                                                      if (snapshot
                                                          .data!.isEmpty) {
                                                        return Container();
                                                      }
                                                      final nomeVeiculoRecord =
                                                          nomeVeiculoRecordList
                                                                  .isNotEmpty
                                                              ? nomeVeiculoRecordList
                                                                  .first
                                                              : null;
                                                      return TextFormField(
                                                        controller:
                                                            nomeController1,
                                                        readOnly: true,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText: 'Nome',
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyText2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBtnText,
                                                                    fontSize:
                                                                        16,
                                                                  ),
                                                          hintText:
                                                              clienteDetalheVeiculoRecord
                                                                  .placa,
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyText2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBtnText,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .grayIcon,
                                                              width: 2,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .grayIcon,
                                                              width: 2,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 2,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 2,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          filled: true,
                                                          fillColor:
                                                              Color(0xFF20222C),
                                                          contentPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16,
                                                                      24,
                                                                      0,
                                                                      24),
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontSize: 14,
                                                                ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 5, 16, 0),
                                      child: StreamBuilder<
                                          List<VeiculoSystemRecord>>(
                                        stream: queryVeiculoSystemRecord(
                                          queryBuilder: (veiculoSystemRecord) =>
                                              veiculoSystemRecord.where('Placa',
                                                  isEqualTo:
                                                      clienteDetalheVeiculoRecord
                                                          .placa),
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  size: 50,
                                                ),
                                              ),
                                            );
                                          }
                                          List<VeiculoSystemRecord>
                                              rowVeiculoSystemRecordList =
                                              snapshot.data!;
                                          // Return an empty Container when the document does not exist.
                                          if (snapshot.data!.isEmpty) {
                                            return Container();
                                          }
                                          final rowVeiculoSystemRecord =
                                              rowVeiculoSystemRecordList
                                                      .isNotEmpty
                                                  ? rowVeiculoSystemRecordList
                                                      .first
                                                  : null;
                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 2, 0),
                                                  child: TextFormField(
                                                    controller: nomeController2,
                                                    readOnly: true,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText: 'Nome',
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText2
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBtnText,
                                                              ),
                                                      hintText:
                                                          rowVeiculoSystemRecord!
                                                              .marca,
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText2,
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .grayIcon,
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .grayIcon,
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                          Color(0xFF20222C),
                                                      contentPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(16, 24,
                                                                  0, 24),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(2, 0, 0, 0),
                                                  child: TextFormField(
                                                    controller: nomeController3,
                                                    readOnly: true,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText: 'Nome',
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText2
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBtnText,
                                                              ),
                                                      hintText:
                                                          rowVeiculoSystemRecord!
                                                              .modelo,
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText2,
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .grayIcon,
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .grayIcon,
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                          Color(0xFF20222C),
                                                      contentPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(16, 24,
                                                                  0, 24),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 5, 16, 0),
                                      child: StreamBuilder<
                                          List<VeiculoSystemRecord>>(
                                        stream: queryVeiculoSystemRecord(
                                          queryBuilder: (veiculoSystemRecord) =>
                                              veiculoSystemRecord.where('Placa',
                                                  isEqualTo:
                                                      clienteDetalheVeiculoRecord
                                                          .placa),
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  size: 50,
                                                ),
                                              ),
                                            );
                                          }
                                          List<VeiculoSystemRecord>
                                              rowVeiculoSystemRecordList =
                                              snapshot.data!;
                                          // Return an empty Container when the document does not exist.
                                          if (snapshot.data!.isEmpty) {
                                            return Container();
                                          }
                                          final rowVeiculoSystemRecord =
                                              rowVeiculoSystemRecordList
                                                      .isNotEmpty
                                                  ? rowVeiculoSystemRecordList
                                                      .first
                                                  : null;
                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 2, 0),
                                                  child: TextFormField(
                                                    controller: nomeController4,
                                                    readOnly: true,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText: 'Nome',
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText2
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBtnText,
                                                              ),
                                                      hintText:
                                                          clienteDetalheVeiculoRecord
                                                              .tipoDeVeiculo,
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText2,
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .grayIcon,
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .grayIcon,
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                          Color(0xFF20222C),
                                                      contentPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(16, 24,
                                                                  0, 24),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(2, 0, 0, 0),
                                                  child: TextFormField(
                                                    controller: nomeController5,
                                                    readOnly: true,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText: 'Nome',
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText2
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBtnText,
                                                              ),
                                                      hintText:
                                                          clienteDetalheVeiculoRecord
                                                              .quilometragem,
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText2,
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .grayIcon,
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .grayIcon,
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                          Color(0xFF20222C),
                                                      contentPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(16, 24,
                                                                  0, 24),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 5, 16, 0),
                                      child: StreamBuilder<
                                          List<VeiculoSystemRecord>>(
                                        stream: queryVeiculoSystemRecord(
                                          queryBuilder: (veiculoSystemRecord) =>
                                              veiculoSystemRecord.where('Placa',
                                                  isEqualTo:
                                                      clienteDetalheVeiculoRecord
                                                          .placa),
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  size: 50,
                                                ),
                                              ),
                                            );
                                          }
                                          List<VeiculoSystemRecord>
                                              rowVeiculoSystemRecordList =
                                              snapshot.data!;
                                          // Return an empty Container when the document does not exist.
                                          if (snapshot.data!.isEmpty) {
                                            return Container();
                                          }
                                          final rowVeiculoSystemRecord =
                                              rowVeiculoSystemRecordList
                                                      .isNotEmpty
                                                  ? rowVeiculoSystemRecordList
                                                      .first
                                                  : null;
                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 2, 0),
                                                  child: TextFormField(
                                                    controller: nomeController6,
                                                    readOnly: true,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText: 'Nome',
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText2
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBtnText,
                                                              ),
                                                      hintText:
                                                          clienteDetalheVeiculoRecord
                                                              .nomeDoDonoGzox,
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText2,
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .grayIcon,
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .grayIcon,
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                          Color(0xFF20222C),
                                                      contentPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(16, 24,
                                                                  0, 24),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 12, 0, 0),
                                        child: DefaultTabController(
                                          length: 2,
                                          initialIndex: 0,
                                          child: Column(
                                            children: [
                                              TabBar(
                                                labelColor: Colors.white,
                                                unselectedLabelColor:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary400,
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle1,
                                                indicatorColor:
                                                    Color(0xFFFF4D00),
                                                tabs: [
                                                  Tab(
                                                    text: 'Aplicações',
                                                  ),
                                                  Tab(
                                                    text: 'Manutenções',
                                                  ),
                                                ],
                                              ),
                                              Expanded(
                                                child: TabBarView(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 24),
                                                      child: StreamBuilder<
                                                          List<
                                                              AplicacaoGzoxRecord>>(
                                                        stream:
                                                            queryAplicacaoGzoxRecord(
                                                          queryBuilder: (aplicacaoGzoxRecord) =>
                                                              aplicacaoGzoxRecord.where(
                                                                  'placa',
                                                                  isEqualTo:
                                                                      clienteDetalheVeiculoRecord
                                                                          .placa),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50,
                                                                height: 50,
                                                                child:
                                                                    SpinKitChasingDots(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  size: 50,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<AplicacaoGzoxRecord>
                                                              listViewAplicacaoGzoxRecordList =
                                                              snapshot.data!;
                                                          return ListView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            primary: false,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                listViewAplicacaoGzoxRecordList
                                                                    .length,
                                                            itemBuilder: (context,
                                                                listViewIndex) {
                                                              final listViewAplicacaoGzoxRecord =
                                                                  listViewAplicacaoGzoxRecordList[
                                                                      listViewIndex];
                                                              return Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16,
                                                                            0,
                                                                            16,
                                                                            8),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            'Produto aplicado',
                                                                            style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: Color(0xFFFF4D00),
                                                                                ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                4,
                                                                                0,
                                                                                8),
                                                                            child:
                                                                                Text(
                                                                              listViewAplicacaoGzoxRecord.produtoGzox!,
                                                                              style: FlutterFlowTheme.of(context).title3,
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            'Aplicador',
                                                                            style: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: Color(0xFFFF4D00),
                                                                                  fontSize: 13,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            listViewAplicacaoGzoxRecord.aplicadorCredenciado!,
                                                                            style: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                  fontSize: 13,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              8,
                                                                              8,
                                                                              0,
                                                                              8),
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(12),
                                                                        child: Image
                                                                            .network(
                                                                          listViewAplicacaoGzoxRecord
                                                                              .fotoDoProduto!,
                                                                          width:
                                                                              100,
                                                                          height:
                                                                              100,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    Container(),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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
        );
      },
    );
  }
}
