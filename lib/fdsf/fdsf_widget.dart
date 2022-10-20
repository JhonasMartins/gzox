import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class FdsfWidget extends StatefulWidget {
  const FdsfWidget({Key? key}) : super(key: key);

  @override
  _FdsfWidgetState createState() => _FdsfWidgetState();
}

class _FdsfWidgetState extends State<FdsfWidget> {
  List<String>? choiceChipsValues;
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
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            print('IconButton pressed ...');
          },
        ),
        title: Text(
          'Page Title',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              FlutterFlowChoiceChips(
                options: [
                  ChipData('Option 1', Icons.train_outlined),
                  ChipData('fdsfs')
                ],
                onChanged: (val) => setState(() => choiceChipsValues = val),
                selectedChipStyle: ChipStyle(
                  backgroundColor: Color(0xFF323B45),
                  textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                  iconColor: Colors.white,
                  iconSize: 18,
                  elevation: 4,
                ),
                unselectedChipStyle: ChipStyle(
                  backgroundColor: Colors.white,
                  textStyle: FlutterFlowTheme.of(context).bodyText2.override(
                        fontFamily: 'Poppins',
                        color: Color(0xFF323B45),
                      ),
                  iconColor: Color(0xFF323B45),
                  iconSize: 18,
                  elevation: 4,
                ),
                chipSpacing: 20,
                multiselect: true,
                initialized: choiceChipsValues != null,
                alignment: WrapAlignment.start,
              ),
              InkWell(
                onTap: () async {
                  final aplicacaoGzoxCreateData = {
                    'Produtos_secundarios': FFAppState().Secundarios,
                  };
                  await AplicacaoGzoxRecord.collection
                      .doc()
                      .set(aplicacaoGzoxCreateData);
                },
                child: Icon(
                  Icons.settings_outlined,
                  color: Colors.black,
                  size: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
