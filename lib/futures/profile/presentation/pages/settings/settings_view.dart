import '/core/utils/custom_widgets.dart';
import 'widgets/settings_body.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBackground,
      appBar: CustomAppBar(backgroundColor: Colors.transparent),
      body: SettingsBody(),
    );
  }
}
