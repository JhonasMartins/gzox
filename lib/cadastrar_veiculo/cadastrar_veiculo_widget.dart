import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_search/text_search.dart';

class CadastrarVeiculoWidget extends StatefulWidget {
  const CadastrarVeiculoWidget({Key? key}) : super(key: key);

  @override
  _CadastrarVeiculoWidgetState createState() => _CadastrarVeiculoWidgetState();
}

class _CadastrarVeiculoWidgetState extends State<CadastrarVeiculoWidget> {
  List<VeiculoRecord> simpleSearchResults = [];
  String? tipoDeVeiculoValue;
  TextEditingController? placaController;
  TextEditingController? marcaController;
  TextEditingController? modeloController;
  TextEditingController? quilometragemController;
  TextEditingController? emailDoDonoController;
  TextEditingController? nomeDoProprietarioController;
  TextEditingController? whatsappDoDonoController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailDoDonoController = TextEditingController();
    marcaController = TextEditingController();
    placaController = TextEditingController();
    modeloController = TextEditingController();
    quilometragemController = TextEditingController();
    nomeDoProprietarioController = TextEditingController();
    whatsappDoDonoController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    emailDoDonoController?.dispose();
    marcaController?.dispose();
    placaController?.dispose();
    modeloController?.dispose();
    quilometragemController?.dispose();
    nomeDoProprietarioController?.dispose();
    whatsappDoDonoController?.dispose();
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
          'Cadastrar veículo',
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
            autovalidateMode: AutovalidateMode.always,
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
                          controller: placaController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Placa / Chassis / Registro / Prefixo',
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
                              return 'Este campo é obrigatório';
                            }

                            if (val.length < 7) {
                              return 'Requires at least 7 characters.';
                            }
                            if (val.length > 7) {
                              return '*Atenção* Confira a placa do veículo antes de registrar.';
                            }
                            if (!RegExp(r"").hasMatch(val)) {
                              return 'Invalid text';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(28, 12, 28, 0),
                        child: FlutterFlowDropDown(
                          options: FFAppState().Veiculos.toList(),
                          onChanged: (val) =>
                              setState(() => tipoDeVeiculoValue = val),
                          width: double.infinity,
                          height: 60,
                          textStyle: FlutterFlowTheme.of(context).bodyText1,
                          hintText: 'Selecione o tipo de veículo...',
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
                        padding: EdgeInsetsDirectional.fromSTEB(28, 16, 28, 0),
                        child: TextFormField(
                          controller: marcaController,
                          onFieldSubmitted: (_) async {
                            if (formKey.currentState == null ||
                                !formKey.currentState!.validate()) {
                              return;
                            }

                            if (tipoDeVeiculoValue == null) {
                              return;
                            }
                          },
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Marca',
                            labelStyle: FlutterFlowTheme.of(context).bodyText1,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).grayIcon,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).grayIcon,
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
                              return 'Este é um campo obrigatório.';
                            }

                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(28, 16, 28, 0),
                        child: TextFormField(
                          controller: modeloController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Modelo',
                            labelStyle: FlutterFlowTheme.of(context).bodyText1,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).grayIcon,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).grayIcon,
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
                              return 'Este é um campo obrigatório.';
                            }

                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(28, 16, 28, 0),
                        child: TextFormField(
                          controller: quilometragemController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Quilometragem atual',
                            labelStyle: FlutterFlowTheme.of(context).bodyText1,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).grayIcon,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).grayIcon,
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
                          keyboardType: TextInputType.number,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Este é um campo obrigatório.';
                            }

                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Text(
                          'Dados do proprietário',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(28, 10, 28, 0),
                        child: TextFormField(
                          controller: emailDoDonoController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Email do proprietário',
                            labelStyle: FlutterFlowTheme.of(context).bodyText1,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).grayIcon,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).grayIcon,
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
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Insira um email';
                            }

                            if (!RegExp(kTextValidatorEmailRegex)
                                .hasMatch(val)) {
                              return 'Has to be a valid email address.';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(28, 10, 28, 0),
                        child: TextFormField(
                          controller: nomeDoProprietarioController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Nome do proprietário',
                            labelStyle: FlutterFlowTheme.of(context).bodyText1,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).grayIcon,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).grayIcon,
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
                              return 'Este é um campo obrigatório.';
                            }

                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Text(
                          'Whatsapp do proprietário',
                          style:
                              FlutterFlowTheme.of(context).bodyText2.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(28, 10, 28, 0),
                        child: TextFormField(
                          controller: whatsappDoDonoController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Whatsapp do proprietário',
                            labelStyle:
                                FlutterFlowTheme.of(context).title3.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                    ),
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
                            suffixIcon: FaIcon(
                              FontAwesomeIcons.whatsapp,
                              color: Color(0xFF39D262),
                              size: 22,
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).title3.override(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                              ),
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          keyboardType: TextInputType.phone,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Field is required';
                            }

                            if (val.length < 11) {
                              return 'Requires at least 11 characters.';
                            }
                            if (val.length > 11) {
                              return 'Verifique o número, tem mais de 11 digitos.';
                            }
                            if (!RegExp(r"").hasMatch(val)) {
                              return 'Invalid text';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Text(
                          '( Não esqueça o DDD.  Exp: 43900000000 )',
                          style:
                              FlutterFlowTheme.of(context).bodyText2.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 50),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await queryVeiculoRecordOnce()
                            .then(
                              (records) => simpleSearchResults = TextSearch(
                                records
                                    .map(
                                      (record) => TextSearchItem(
                                          record, [record.placa!]),
                                    )
                                    .toList(),
                              )
                                  .search(placaController!.text)
                                  .map((r) => r.object)
                                  .take(2)
                                  .toList(),
                            )
                            .onError((_, __) => simpleSearchResults = [])
                            .whenComplete(() => setState(() {}));

                        if (simpleSearchResults.length > 0) {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Veículo cadastrado'),
                                content: Text(
                                    'Este veículo já foi registrado no sistema GZOX, acesse a página \"retorno\"  para uma nova aplicação. '),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          context.pushNamed(
                            'Cadastrar_o_produto',
                            queryParams: {
                              'placa': serializeParam(
                                placaController!.text,
                                ParamType.String,
                              ),
                              'whatsapp': serializeParam(
                                whatsappDoDonoController!.text,
                                ParamType.String,
                              ),
                              'email': serializeParam(
                                emailDoDonoController!.text,
                                ParamType.String,
                              ),
                              'quilometragem': serializeParam(
                                quilometragemController!.text,
                                ParamType.String,
                              ),
                              'marca': serializeParam(
                                marcaController!.text,
                                ParamType.String,
                              ),
                              'modelo': serializeParam(
                                modeloController!.text,
                                ParamType.String,
                              ),
                              'tipo': serializeParam(
                                'Carro',
                                ParamType.String,
                              ),
                              'user': serializeParam(
                                currentUserReference,
                                ParamType.DocumentReference,
                              ),
                              'nome': serializeParam(
                                nomeDoProprietarioController!.text,
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        }
                      },
                      text: 'Cadastrar  produto',
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
