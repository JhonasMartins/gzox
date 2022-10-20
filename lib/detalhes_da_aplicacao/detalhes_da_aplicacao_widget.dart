import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class DetalhesDaAplicacaoWidget extends StatefulWidget {
  const DetalhesDaAplicacaoWidget({
    Key? key,
    this.placa,
    this.marca,
    this.modelo,
    this.quilometragem,
    this.nome,
    this.email,
    this.whatsapp,
    this.tipo,
  }) : super(key: key);

  final String? placa;
  final String? marca;
  final String? modelo;
  final String? quilometragem;
  final String? nome;
  final String? email;
  final String? whatsapp;
  final String? tipo;

  @override
  _DetalhesDaAplicacaoWidgetState createState() =>
      _DetalhesDaAplicacaoWidgetState();
}

class _DetalhesDaAplicacaoWidgetState extends State<DetalhesDaAplicacaoWidget> {
  String? choiceChipsValue1;
  String? choiceChipsValue2;
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
    nomeController1 = TextEditingController(text: widget.nome);
    nomeController2 = TextEditingController(text: widget.placa);
    nomeController3 = TextEditingController(text: widget.marca);
    nomeController4 = TextEditingController(text: widget.modelo);
    nomeController5 = TextEditingController(text: widget.quilometragem);
    nomeController6 = TextEditingController(text: widget.tipo);
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
                    queryBuilder: (aplicacaoGzoxRecord) => aplicacaoGzoxRecord
                        .where('placa', isEqualTo: widget.placa),
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
                            color: FlutterFlowTheme.of(context).primaryColor,
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
                      fit: BoxFit.cover,
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 300, 0, 0),
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
                                      16, 0, 16, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 10),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            context.pushNamed('mapa');
                                          },
                                          text:
                                              'Localizar aplicador mais próximo',
                                          icon: FaIcon(
                                            FontAwesomeIcons.mapPin,
                                          ),
                                          options: FFButtonOptions(
                                            width: 300,
                                            height: 40,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .subtitle2
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color: Colors.white,
                                                    ),
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 5, 16, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 2, 0),
                                          child: TextFormField(
                                            controller: nomeController1,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Nome',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                      ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .grayIcon,
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .grayIcon,
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              filled: true,
                                              fillColor: Color(0xFF20222C),
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(16, 24, 0, 24),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 5, 16, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 2, 0),
                                          child: TextFormField(
                                            controller: nomeController2,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Placa',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                      ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .grayIcon,
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .grayIcon,
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              filled: true,
                                              fillColor: Color(0xFF20222C),
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(16, 24, 0, 24),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 5, 16, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 2, 0),
                                          child: TextFormField(
                                            controller: nomeController3,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Marca',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                      ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .grayIcon,
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .grayIcon,
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              filled: true,
                                              fillColor: Color(0xFF20222C),
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(16, 24, 0, 24),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  2, 0, 0, 0),
                                          child: TextFormField(
                                            controller: nomeController4,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Modelo',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                      ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .grayIcon,
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .grayIcon,
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              filled: true,
                                              fillColor: Color(0xFF20222C),
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(16, 24, 0, 24),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 5, 16, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 2, 0),
                                          child: TextFormField(
                                            controller: nomeController5,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'KM',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                      ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .grayIcon,
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .grayIcon,
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              filled: true,
                                              fillColor: Color(0xFF20222C),
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(16, 24, 0, 24),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  2, 0, 0, 0),
                                          child: TextFormField(
                                            controller: nomeController6,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Tipo de veículo',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                      ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .grayIcon,
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .grayIcon,
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              filled: true,
                                              fillColor: Color(0xFF20222C),
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(16, 24, 0, 24),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
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
                                            indicatorColor: Color(0xFFFF4D00),
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
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                              aplicacaoGzoxRecord
                                                                  .where(
                                                                      'placa',
                                                                      isEqualTo:
                                                                          widget
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
                                                                                  color: FlutterFlowTheme.of(context).tertiary400,
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
                                                                              style: FlutterFlowTheme.of(context).title3.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    fontSize: 17,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            'Data da aplicação',
                                                                            style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: FlutterFlowTheme.of(context).tertiary400,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            dateTimeFormat(
                                                                              'd/M/y',
                                                                              listViewAplicacaoGzoxRecord.dataDaAplicacao!,
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                  fontSize: 17,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            'Produtos secundários',
                                                                            style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: FlutterFlowTheme.of(context).tertiary400,
                                                                                ),
                                                                          ),
                                                                          FlutterFlowChoiceChips(
                                                                            options:
                                                                                listViewAplicacaoGzoxRecord.produtosSecundarios!.toList().map((label) => ChipData(label)).toList(),
                                                                            onChanged: (val) =>
                                                                                setState(() => choiceChipsValue1 = val?.first),
                                                                            selectedChipStyle:
                                                                                ChipStyle(
                                                                              backgroundColor: Color(0xFF323B45),
                                                                              textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    color: Colors.white,
                                                                                  ),
                                                                              iconColor: Colors.white,
                                                                              iconSize: 18,
                                                                              elevation: 4,
                                                                            ),
                                                                            unselectedChipStyle:
                                                                                ChipStyle(
                                                                              backgroundColor: Colors.white,
                                                                              textStyle: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    color: Color(0xFF323B45),
                                                                                  ),
                                                                              iconColor: Color(0xFF323B45),
                                                                              iconSize: 18,
                                                                              elevation: 4,
                                                                            ),
                                                                            chipSpacing:
                                                                                20,
                                                                            multiselect:
                                                                                false,
                                                                            alignment:
                                                                                WrapAlignment.start,
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
                                                                              .fotografia!,
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
                                                              aplicacaoGzoxRecord
                                                                  .where(
                                                                      'placa',
                                                                      isEqualTo:
                                                                          widget
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
                                                                                  color: Colors.white,
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
                                                                            dateTimeFormat(
                                                                              'd/M/y',
                                                                              listViewAplicacaoGzoxRecord.dataDaAplicacao!,
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: Color(0xFFFF6424),
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
                                                                              .fotografia!,
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
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 24),
                                                  child: StreamBuilder<
                                                      List<
                                                          ManutencaoGzoxRecord>>(
                                                    stream:
                                                        queryManutencaoGzoxRecord(
                                                      queryBuilder:
                                                          (manutencaoGzoxRecord) =>
                                                              manutencaoGzoxRecord
                                                                  .where(
                                                                      'placa',
                                                                      isEqualTo:
                                                                          widget
                                                                              .placa),
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
                                                      List<ManutencaoGzoxRecord>
                                                          listViewManutencaoGzoxRecordList =
                                                          snapshot.data!;
                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        primary: false,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            listViewManutencaoGzoxRecordList
                                                                .length,
                                                        itemBuilder: (context,
                                                            listViewIndex) {
                                                          final listViewManutencaoGzoxRecord =
                                                              listViewManutencaoGzoxRecordList[
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
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        'Produto de manutenção',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText2
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: FlutterFlowTheme.of(context).tertiary400,
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
                                                                          listViewManutencaoGzoxRecord
                                                                              .produtoManutencao!,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .title3
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                fontSize: 17,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        'Data da manutenção',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText2
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: FlutterFlowTheme.of(context).tertiary400,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        dateTimeFormat(
                                                                          'd/M/y',
                                                                          listViewManutencaoGzoxRecord
                                                                              .dataDaManutencao!,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .subtitle1
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        'Produtos secundários',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText2
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: FlutterFlowTheme.of(context).tertiary400,
                                                                            ),
                                                                      ),
                                                                      FlutterFlowChoiceChips(
                                                                        options: listViewManutencaoGzoxRecord
                                                                            .secund!
                                                                            .toList()
                                                                            .map((label) =>
                                                                                ChipData(label))
                                                                            .toList(),
                                                                        onChanged:
                                                                            (val) =>
                                                                                setState(() => choiceChipsValue2 = val?.first),
                                                                        selectedChipStyle:
                                                                            ChipStyle(
                                                                          backgroundColor:
                                                                              Color(0xFF323B45),
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: Colors.white,
                                                                              ),
                                                                          iconColor:
                                                                              Colors.white,
                                                                          iconSize:
                                                                              18,
                                                                          elevation:
                                                                              4,
                                                                        ),
                                                                        unselectedChipStyle:
                                                                            ChipStyle(
                                                                          backgroundColor:
                                                                              Colors.white,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .bodyText2
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: Color(0xFF323B45),
                                                                              ),
                                                                          iconColor:
                                                                              Color(0xFF323B45),
                                                                          iconSize:
                                                                              18,
                                                                          elevation:
                                                                              4,
                                                                        ),
                                                                        chipSpacing:
                                                                            20,
                                                                        multiselect:
                                                                            false,
                                                                        alignment:
                                                                            WrapAlignment.start,
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
                                                                        BorderRadius.circular(
                                                                            12),
                                                                    child: Image
                                                                        .network(
                                                                      listViewManutencaoGzoxRecord
                                                                          .fotoDaManutencao!,
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
  }
}
