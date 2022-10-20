import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:map_launcher/map_launcher.dart' as $ml;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MapasWidget extends StatefulWidget {
  const MapasWidget({
    Key? key,
    this.user,
  }) : super(key: key);

  final DocumentReference? user;

  @override
  _MapasWidgetState createState() => _MapasWidgetState();
}

class _MapasWidgetState extends State<MapasWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset(
              'assets/images/fdsfsdfdsfds.webp',
            ).image,
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              color: Color(0x2B000000),
              offset: Offset(0, 4),
            )
          ],
          gradient: LinearGradient(
            colors: [Color(0x2B000000), Colors.black],
            stops: [1, 1],
            begin: AlignmentDirectional(0, -1),
            end: AlignmentDirectional(0, 1),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: StreamBuilder<MapasRecord>(
          stream: MapasRecord.getDocument(widget.user!),
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
            final columnMapasRecord = snapshot.data!;
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Text(
                              columnMapasRecord.nomeDaEstetica!,
                              style: FlutterFlowTheme.of(context)
                                  .subtitle1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 22, 16, 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await launchURL(
                                'https://wa.me/55${columnMapasRecord.whatsapp}');
                          },
                          text: 'Whatsapp',
                          icon: FaIcon(
                            FontAwesomeIcons.whatsapp,
                          ),
                          options: FFButtonOptions(
                            width: 155,
                            height: 40,
                            color: FlutterFlowTheme.of(context).customColor1,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await launchMap(
                              location: columnMapasRecord.latitudeLogitude,
                              title: columnMapasRecord.nomeDaEstetica!,
                            );
                          },
                          text: 'Rota',
                          icon: FaIcon(
                            FontAwesomeIcons.mapMarkedAlt,
                          ),
                          options: FFButtonOptions(
                            width: 150,
                            height: 40,
                            color: FlutterFlowTheme.of(context).tertiary400,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
