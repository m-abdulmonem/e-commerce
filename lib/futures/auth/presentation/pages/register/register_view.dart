import 'package:flutter/material.dart';
import 'widgets/register_body.dart';
class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: const RegisterBody(),
    );
  }
}
