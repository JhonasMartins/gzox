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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CadastrarOProdutoWidget extends StatefulWidget {
  const CadastrarOProdutoWidget({
    Key? key,
    this.placa,
    this.whatsapp,
    this.email,
    this.quilometragem,
    this.marca,
    this.modelo,
    this.tipo,
    this.user,
    this.nome,
  }) : super(key: key);

  final String? placa;
  final String? whatsapp;
  final String? email;
  final String? quilometragem;
  final String? marca;
  final String? modelo;
  final String? tipo;
  final DocumentReference? user;
  final String? nome;

  @override
  _CadastrarOProdutoWidgetState createState() =>
      _CadastrarOProdutoWidgetState();
}

class _CadastrarOProdutoWidgetState extends State<CadastrarOProdutoWidget> {
  bool isMediaUploading = false;
  String uploadedFileUrl = '';

  DateTime? datePicked;
  TextEditingController? codigoDoProdutoController;
  String? produtoPrincipalValue;
  List<String>? produtosSecundariosValues;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    codigoDoProdutoController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    codigoDoProdutoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF1A1B24),
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
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
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Field is required';
                            }

                            if (val.length < 8) {
                              return 'Requires at least 8 characters.';
                            }
                            if (val.length > 8) {
                              return 'O código de autenticidade tem apenas 8 digitos.';
                            }

                            return null;
                          },
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
                        alignment: WrapAlignment.start,
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
                    child: FFButtonWidget(
                      onPressed: () async {
                        final aplicacaoGzoxCreateData = {
                          ...createAplicacaoGzoxRecordData(
                            codigoDoProduto: codigoDoProdutoController!.text,
                            dataDaAplicacao: datePicked,
                            produtoGzox: produtoPrincipalValue,
                            aplicadorCredenciado: currentUserDisplayName,
                            placa: widget.placa,
                            fotografia: uploadedFileUrl,
                          ),
                          'Produtos_secundarios': produtosSecundariosValues,
                        };
                        await AplicacaoGzoxRecord.collection
                            .doc()
                            .set(aplicacaoGzoxCreateData);

                        final veiculoCreateData = createVeiculoRecordData(
                          tipoDeVeiculo: widget.tipo,
                          marca: widget.marca,
                          modelo: widget.modelo,
                          quilometragem: widget.quilometragem,
                          emailDoDonoGzox: widget.email,
                          nomeDoDonoGzox: widget.nome,
                          whatsappDoDonoGzox: widget.whatsapp,
                          placa: widget.placa,
                          user: widget.user,
                        );
                        await VeiculoRecord.collection
                            .doc()
                            .set(veiculoCreateData);
                        // Xano
                        await XanoCall.call(
                          whatsapp: widget.whatsapp,
                          email: widget.email,
                          nome: widget.nome,
                        );
                        // Boas vindas
                        await EnviarMensagemCall.call(
                          nome: 'Olá, ${widget.nome}',
                          whatsapp: '55${widget.whatsapp}',
                          mensagem:
                              'É com grande satisfação que recebemos o registro  do seu veículo em nosso banco de dados.',
                        );
                        // Placa do veículo
                        await EnviarMensagemCall.call(
                          nome: 'Placa do veículo: ${widget.placa}',
                          whatsapp: '55${widget.whatsapp}',
                        );
                        // Marca
                        await EnviarMensagemCall.call(
                          nome: 'Marca: ${widget.marca}',
                          whatsapp: '55${widget.whatsapp}',
                        );
                        // Modelo
                        await EnviarMensagemCall.call(
                          nome: 'Modelo: ${widget.modelo}',
                          whatsapp: '55${widget.whatsapp}',
                        );
                        // Foto do véiculo
                        await EnviarFotoCall.call(
                          whatsapp: '55${widget.whatsapp}',
                          imagem: uploadedFileUrl,
                        );
                        // Produto aplicado
                        await EnviarMensagemCall.call(
                          nome:
                              'Recebeu nosso sistema de proteção de pintura ${produtoPrincipalValue}  aplicado por nosso credenciado',
                          whatsapp: '55${widget.whatsapp}',
                        );
                        // Contato do aplicador
                        await ContatoCall.call(
                          whatsappParaEnviar: '55${widget.whatsapp}',
                          nomeDoContato: currentUserDisplayName,
                          whatsappDoAplicador: '55${currentPhoneNumber}',
                        );

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
