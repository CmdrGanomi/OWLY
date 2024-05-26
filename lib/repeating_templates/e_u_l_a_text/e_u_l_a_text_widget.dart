import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'e_u_l_a_text_model.dart';
export 'e_u_l_a_text_model.dart';

class EULATextWidget extends StatefulWidget {
  const EULATextWidget({super.key});

  @override
  State<EULATextWidget> createState() => _EULATextWidgetState();
}

class _EULATextWidgetState extends State<EULATextWidget> {
  late EULATextModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EULATextModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            AutoSizeText(
              'End-User License Agreement (EULA) for OWLY\n\nPlease carefully review this End-User License Agreement (\"Agreement\") before using OWLY (\"Application\") on your mobile device.\n\nThis Agreement is a legal contract between you (\"User\") and OWLY - Developer (\"Developer\"), governing your use of the OWLY mobile application.\n\nBy installing and using OWLY, you agree to be bound by the terms and conditions of this\nAgreement.\n\nDescription of the Application: OWLY is a multipurpose mobile application developed by OWLY - Developer to enhance the educational experience at STI College Pasay-EDSA. \n\nThe application offers features such as event calendars, communication platforms, and community and\nsocial functions, and facilitates payment transactions for tuition fees and other miscellaneous fees, aiming to redefine the college experience beyond traditional payment methods.\n\nGrant of License: Subject to the terms and conditions of this Agreement, OWLY - Developer grants User a limited, non-exclusive, non-transferable, revocable license to use OWLY solely for personal, non-commercial purposes on a mobile device owned or controlled by User.\n\nRestrictions: User shall not:\n• Modify, adapt, translate, reverse engineer, decompile, disassemble, or create derivative\nworks based on OWLY.\n• Bypass or disable any security or technological features or measures in OWLY.\n• Use OWLY for any unlawful purpose or in any manner inconsistent with this Agreement.\n• Share, distribute, sublicense, or transfer OWLY to any third party.\n• Use OWLY in any way that could harm, disable, overburden, or impair its functionality.\n\nIntellectual Property Rights: OWLY and all intellectual property rights therein are and shall remain the exclusive property of OWLY - Developer. This Agreement does not convey to the User any rights of ownership in OWLY or any intellectual property rights therein.\n\nPrivacy Policy: By using OWLY, the User acknowledges and agrees that their data may be collected and processed by OWLY - Developer\'s Privacy Policy. User consents to such collection and processing of data as described in the Privacy Policy.\n\nDisclaimer of Warranty: OWLY is provided \"as is\" and \"as available\" without any warranties of any kind, whether express or implied. OWLY - The Developer does not warrant that OWLY will be error-free or uninterrupted, or that any defects will be corrected.\n\nLimitation of Liability: OWLY - Developer shall not be liable for any indirect, incidental, special, consequential, or punitive damages arising out of or relating to User\'s use of OWLY, even if OWLY - Developer has been advised of the possibility of such damages.\n\nTermination: OWLY - Developer may terminate this Agreement at any time without notice if User breaches any provision of this Agreement. Upon termination, the User must cease all use of\nOWLY and destroy all copies of OWLY in the User\'s possession or control.\n\nGoverning Law: This Agreement shall be governed by and construed under the laws of the Philippines, without regard to its conflicts of law principles.\n\nChanges to Agreement: OWLY - Developer reserves the right to update or modify this\nAgreement at any time with prior notice. User\'s continued use of OWLY after any such changes shall constitute User\'s acceptance of the revised Agreement.\nContact Information: If you have any questions or concerns about this Agreement, please contact us at owlysti@gmail.com.\n\nBy installing and using OWLY, you acknowledge that you have read, understood, and agree to be bound by the terms and conditions of this Agreement.\n\nLast updated: May 9, 2024\nOWLY - Developer',
              style: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: 'Encode Sans',
                    color: FlutterFlowTheme.of(context).secondaryText,
                    letterSpacing: 0.0,
                  ),
              minFontSize: 16.0,
            ),
          ],
        ),
      ),
    );
  }
}
