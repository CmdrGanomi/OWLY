import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/repeating_templates/e_u_l_a_text/e_u_l_a_text_widget.dart';
import 'e_u_l_a_page2_widget.dart' show EULAPage2Widget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EULAPage2Model extends FlutterFlowModel<EULAPage2Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for EULAText component.
  late EULATextModel eULATextModel;

  @override
  void initState(BuildContext context) {
    eULATextModel = createModel(context, () => EULATextModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    eULATextModel.dispose();
  }
}
