import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../flutter_flow/permissions_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_search/text_search.dart';
import 'package:url_launcher/url_launcher.dart';

class RetornoWidget extends StatefulWidget {
  const RetornoWidget({Key? key}) : super(key: key);

  @override
  _RetornoWidgetState createState() => _RetornoWidgetState();
}

class _RetornoWidgetState extends State<RetornoWidget> {
  bool isMediaUploading = false;
  String uploadedFileUrl = '';

  DateTime? datePicked;
  List<VeiculoRecord> simpleSearchResults = [];
  TextEditingController? placaController;
  TextEditingController? codigoDoProdutoController;
  String? produtoPrincipalValue;
  List<String>? produtosSecundariosValues;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    codigoDoProdutoController = TextEditingController();
    placaController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    codigoDoProdutoController?.dispose();
    placaController?.dispose();
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
          'Cadastrar produto',
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Poppins',
                fontSize: 18,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(28, 22, 28, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: placaController,
                                onFieldSubmitted: (_) async {
                                  await queryVeiculoRecordOnce()
                                      .then(
                                        (records) => simpleSearchResults =
                                            TextSearch(
                                          records
                                              .map(
                                                (record) => TextSearchItem(
                                                    record, [record.placa!]),
                                              )
                                              .toList(),
                                        )
                                                .search(placaController!.text)
                                                .map((r) => r.object)
                                                .take(1)
                                                .toList(),
                                      )
                                      .onError(
                                          (_, __) => simpleSearchResults = [])
                                      .whenComplete(() => setState(() {}));
                                },
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Placa / Chassis ',
                                  labelStyle:
                                      FlutterFlowTheme.of(context).bodyText1,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFFF4D00),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFFF4D00),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: Color(0xFF20222C),
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          20, 32, 20, 12),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .title3
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                    ),
                                textAlign: TextAlign.start,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(24, 16, 24, 4),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Dados do veículo',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xFFFF4900),
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(24, 4, 24, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Marca:',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: Color(0xFF7C8791),
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                  StreamBuilder<List<VeiculoRecord>>(
                                    stream: queryVeiculoRecord(
                                      queryBuilder: (veiculoRecord) =>
                                          veiculoRecord.where('Placa',
                                              isEqualTo: placaController!.text),
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
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 50,
                                            ),
                                          ),
                                        );
                                      }
                                      List<VeiculoRecord>
                                          textVeiculoRecordList =
                                          snapshot.data!;
                                      // Return an empty Container when the document does not exist.
                                      if (snapshot.data!.isEmpty) {
                                        return Container();
                                      }
                                      final textVeiculoRecord =
                                          textVeiculoRecordList.isNotEmpty
                                              ? textVeiculoRecordList.first
                                              : null;
                                      return Text(
                                        textVeiculoRecord!.marca!,
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(24, 4, 24, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Modelo:',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: Color(0xFF7C8791),
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                  StreamBuilder<List<VeiculoRecord>>(
                                    stream: queryVeiculoRecord(
                                      queryBuilder: (veiculoRecord) =>
                                          veiculoRecord.where('Placa',
                                              isEqualTo: placaController!.text),
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
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 50,
                                            ),
                                          ),
                                        );
                                      }
                                      List<VeiculoRecord>
                                          textVeiculoRecordList =
                                          snapshot.data!;
                                      // Return an empty Container when the document does not exist.
                                      if (snapshot.data!.isEmpty) {
                                        return Container();
                                      }
                                      final textVeiculoRecord =
                                          textVeiculoRecordList.isNotEmpty
                                              ? textVeiculoRecordList.first
                                              : null;
                                      return Text(
                                        textVeiculoRecord!.modelo!,
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(24, 4, 24, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Nome:',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: Color(0xFF7C8791),
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                  StreamBuilder<List<VeiculoRecord>>(
                                    stream: queryVeiculoRecord(
                                      queryBuilder: (veiculoRecord) =>
                                          veiculoRecord.where('Placa',
                                              isEqualTo: placaController!.text),
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
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 50,
                                            ),
                                          ),
                                        );
                                      }
                                      List<VeiculoRecord>
                                          textVeiculoRecordList =
                                          snapshot.data!;
                                      // Return an empty Container when the document does not exist.
                                      if (snapshot.data!.isEmpty) {
                                        return Container();
                                      }
                                      final textVeiculoRecord =
                                          textVeiculoRecordList.isNotEmpty
                                              ? textVeiculoRecordList.first
                                              : null;
                                      return Text(
                                        textVeiculoRecord!.nomeDoDonoGzox!,
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(28, 16, 28, 0),
                        child: TextFormField(
                          controller: codigoDoProdutoController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Código do produto',
                            labelStyle: FlutterFlowTheme.of(context).bodyText1,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFFF4D00),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFFF4D00),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Color(0xFF20222C),
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20, 32, 20, 12),
                          ),
                          style: FlutterFlowTheme.of(context).title3.override(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                              ),
                          textAlign: TextAlign.start,
                          maxLines: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(28, 10, 28, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Color(0xFF20222C),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                color: Color(0xFF141B1C),
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).grayIcon,
                            ),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(24, 16, 16, 16),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          dateTimeFormat(
                                            'yMd',
                                            datePicked,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1
                                              .override(
                                                fontFamily: 'Outfit',
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    if (kIsWeb) {
                                      final _datePickedDate =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: getCurrentTimestamp,
                                        firstDate: getCurrentTimestamp,
                                        lastDate: DateTime(2050),
                                      );

                                      if (_datePickedDate != null) {
                                        setState(
                                          () => datePicked = DateTime(
                                            _datePickedDate.year,
                                            _datePickedDate.month,
                                            _datePickedDate.day,
                                          ),
                                        );
                                      }
                                    } else {
                                      await DatePicker.showDatePicker(
                                        context,
                                        showTitleActions: true,
                                        onConfirm: (date) {
                                          setState(() => datePicked = date);
                                        },
                                        currentTime: getCurrentTimestamp,
                                        minTime: getCurrentTimestamp,
                                        locale: LocaleType.values.firstWhere(
                                          (l) =>
                                              l.name ==
                                              FFLocalizations.of(context)
                                                  .languageCode,
                                          orElse: () => LocaleType.en,
                                        ),
                                      );
                                    }
                                  },
                                  text: 'Data',
                                  icon: FaIcon(
                                    FontAwesomeIcons.calendarCheck,
                                  ),
                                  options: FFButtonOptions(
                                    width: 130,
                                    height: 50,
                                    color: Color(0xFFFF4D00),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    elevation: 3,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(28, 12, 28, 0),
                        child: FlutterFlowDropDown(
                          options: FFAppState().Produtos.toList(),
                          onChanged: (val) =>
                              setState(() => produtoPrincipalValue = val),
                          width: double.infinity,
                          height: 60,
                          textStyle: FlutterFlowTheme.of(context).bodyText1,
                          hintText: 'Selecione o produto...',
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 15,
                          ),
                          fillColor: Color(0xFF20222C),
                          elevation: 2,
                          borderColor: FlutterFlowTheme.of(context).grayIcon,
                          borderWidth: 2,
                          borderRadius: 8,
                          margin: EdgeInsetsDirectional.fromSTEB(24, 4, 12, 4),
                          hidesUnderline: true,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                        child: Text(
                          'Produtos secundários',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                  ),
                        ),
                      ),
                      FlutterFlowChoiceChips(
                        options: FFAppState()
                            .Secundarios
                            .map((label) => ChipData(label))
                            .toList(),
                        onChanged: (val) =>
                            setState(() => produtosSecundariosValues = val),
                        selectedChipStyle: ChipStyle(
                          backgroundColor: Color(0xFFFF4D00),
                          textStyle:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                          iconColor: Color(0xFF20222C),
                          iconSize: 18,
                          elevation: 4,
                        ),
                        unselectedChipStyle: ChipStyle(
                          backgroundColor: Color(0xFF20222C),
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyText2
                              .override(
                                fontFamily: 'Poppins',
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                              ),
                          iconColor:
                              FlutterFlowTheme.of(context).primaryBtnText,
                          iconSize: 18,
                          elevation: 4,
                        ),
                        chipSpacing: 20,
                        multiselect: true,
                        initialized: produtosSecundariosValues != null,
                        alignment: WrapAlignment.center,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                        child: Text(
                          'Adicione uma foto do veículo',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                        child: Container(
                          width: 320,
                          height: 266,
                          decoration: BoxDecoration(
                            color: Color(0xFF20222C),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FFButtonWidget(
                                      onPressed: () async {
                                        await requestPermission(
                                            cameraPermission);
                                        final selectedMedia =
                                            await selectMediaWithSourceBottomSheet(
                                          context: context,
                                          allowPhoto: true,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          setState(
                                              () => isMediaUploading = true);
                                          var downloadUrls = <String>[];
                                          try {
                                            showUploadMessage(
                                              context,
                                              'Uploading file...',
                                              showLoading: true,
                                            );
                                            downloadUrls = (await Future.wait(
                                              selectedMedia.map(
                                                (m) async => await uploadData(
                                                    m.storagePath, m.bytes),
                                              ),
                                            ))
                                                .where((u) => u != null)
                                                .map((u) => u!)
                                                .toList();
                                          } finally {
                                            ScaffoldMessenger.of(context)
                                                .hideCurrentSnackBar();
                                            isMediaUploading = false;
                                          }
                                          if (downloadUrls.length ==
                                              selectedMedia.length) {
                                            setState(() => uploadedFileUrl =
                                                downloadUrls.first);
                                            showUploadMessage(
                                                context, 'Success!');
                                          } else {
                                            setState(() {});
                                            showUploadMessage(context,
                                                'Failed to upload media');
                                            return;
                                          }
                                        }
                                      },
                                      text: 'Adicionar foto',
                                      icon: Icon(
                                        Icons.photo_camera_outlined,
                                        size: 15,
                                      ),
                                      options: FFButtonOptions(
                                        width: 200,
                                        height: 50,
                                        color: Color(0xFFFF4D00),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        elevation: 3,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 5, 0, 0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        uploadedFileUrl,
                                        width: 300,
                                        height: 190,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 30),
                    child: StreamBuilder<List<VeiculoRecord>>(
                      stream: queryVeiculoRecord(
                        queryBuilder: (veiculoRecord) => veiculoRecord
                            .where('Placa', isEqualTo: placaController!.text),
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
                        List<VeiculoRecord> buttonVeiculoRecordList =
                            snapshot.data!;
                        // Return an empty Container when the document does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final buttonVeiculoRecord =
                            buttonVeiculoRecordList.isNotEmpty
                                ? buttonVeiculoRecordList.first
                                : null;
                        return FFButtonWidget(
                          onPressed: () async {
                            final aplicacaoGzoxCreateData = {
                              ...createAplicacaoGzoxRecordData(
                                codigoDoProduto:
                                    codigoDoProdutoController!.text,
                                dataDaAplicacao: datePicked,
                                produtoGzox: produtoPrincipalValue,
                                aplicadorCredenciado: currentUserDisplayName,
                                placa: placaController!.text,
                                fotografia: uploadedFileUrl,
                              ),
                              'Produtos_secundarios': produtosSecundariosValues,
                            };
                            await AplicacaoGzoxRecord.collection
                                .doc()
                                .set(aplicacaoGzoxCreateData);
                            // Xano
                            await XanoCall.call(
                              whatsapp: buttonVeiculoRecord!.whatsappDoDonoGzox,
                              email: buttonVeiculoRecord!.emailDoDonoGzox,
                              nome: buttonVeiculoRecord!.nomeDoDonoGzox,
                            );
                            // Boas vindas
                            await EnviarMensagemCall.call(
                              nome:
                                  'Olá, ${buttonVeiculoRecord!.nomeDoDonoGzox}',
                              whatsapp:
                                  '55${buttonVeiculoRecord!.whatsappDoDonoGzox}',
                              mensagem:
                                  'É com grande satisfação que recebemos o registro  do seu veículo em nosso banco de dados.',
                            );
                            // Informamos que
                            await EnviarMensagemCall.call(
                              nome: 'Informamos que seu veículo',
                              whatsapp:
                                  '55${buttonVeiculoRecord!.whatsappDoDonoGzox}',
                            );
                            // Placa do veículo
                            await EnviarMensagemCall.call(
                              nome:
                                  'Placa do veículo: ${buttonVeiculoRecord!.placa}',
                              whatsapp:
                                  '55${buttonVeiculoRecord!.whatsappDoDonoGzox}',
                            );
                            // Marca
                            await EnviarMensagemCall.call(
                              nome: 'Marca: ${buttonVeiculoRecord!.marca}',
                              whatsapp:
                                  '55${buttonVeiculoRecord!.whatsappDoDonoGzox}',
                            );
                            // Modelo
                            await EnviarMensagemCall.call(
                              nome: 'Modelo: ${buttonVeiculoRecord!.modelo}',
                              whatsapp:
                                  '55${buttonVeiculoRecord!.whatsappDoDonoGzox}',
                            );
                            // Produto aplicado
                            await EnviarMensagemCall.call(
                              nome:
                                  'Recebeu nosso sistema de proteção de pintura ${produtoPrincipalValue}  aplicado por nosso credenciado',
                              whatsapp:
                                  '55${buttonVeiculoRecord!.whatsappDoDonoGzox}',
                            );
                            await EnviarMensagemCall.call(
                              nome:
                                  ' A GZOX é a marca mais importante de COATINGS de proteção de pintura da Ásia. Ela e reconhecida internacionalmente pela qualidade dos seus produtos. Fabricada pela SOFT99 Corporation no Japão, a GZOX reúne o que há de mais moderno em qualidade e tecnologia.  Para visualizar as informações no GZOX SYSTEM, baixe o APP conforme seu sistema operacional: https://gzox.com.br/gzox-system/   Recomendamos que faça sempre as manutenções na rede de aplicadores credenciados e que não utilize produtos agressivos para lavagens. Dessa forma, você manterá o coating aplicado sobre o seu veículo sempre com alto nível de repelência.  Em caso de dúvidas procure nossos aplicadores credenciados ou entre em contato conosco através do email: contato@soft99brasil.com.br  Att. Equipe GZOX BRASIL',
                              whatsapp:
                                  '55${buttonVeiculoRecord!.whatsappDoDonoGzox}',
                            );
                            // Foto do véiculo
                            await EnviarFotoCall.call(
                              whatsapp:
                                  '55${buttonVeiculoRecord!.whatsappDoDonoGzox}',
                              imagem: uploadedFileUrl,
                            );
                            // Contato do aplicador
                            await ContatoCall.call(
                              whatsappParaEnviar:
                                  '55${buttonVeiculoRecord!.whatsappDoDonoGzox}',
                              nomeDoContato: currentUserDisplayName,
                              whatsappDoAplicador: '55${currentPhoneNumber}',
                            );
                            await launchUrl(Uri(
                                scheme: 'mailto',
                                path: buttonVeiculoRecord!.emailDoDonoGzox!,
                                query: {
                                  'subject': 'Aplicação GZOX',
                                  'body':
                                      'Prezado${buttonVeiculoRecord!.nomeDoDonoGzox}, informamos que seu veículo foi registrado no nosso sistema de autenticação de produtos. Acesse o GZOX SYSTEM  e saiba mais.',
                                }
                                    .entries
                                    .map((MapEntry<String, String> e) =>
                                        '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                    .join('&')));

                            context.pushNamed('sucesso');
                          },
                          text: 'Registrar',
                          icon: Icon(
                            Icons.double_arrow,
                            size: 15,
                          ),
                          options: FFButtonOptions(
                            width: 270,
                            height: 50,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle1.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                            elevation: 3,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
