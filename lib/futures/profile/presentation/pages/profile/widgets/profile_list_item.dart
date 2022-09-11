import '/core/utils/custom_widgets.dart';
import 'package:flutter/material.dart';

class ProfileListItem extends StatelessWidget {
  final String title, description,pageRoute;
  const ProfileListItem(
      {Key? key, required this.title, required this.description, required this.pageRoute})
      : super(key: key);

  Widget _buildTitle() {
    return CustomText(
      title,
      fontSize: 20,
      letterSpacing: .9,
      fontWeight: FontWeight.w700,
    );
  }

  Widget _buildDescription() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: CustomText(
        description,
        color: colorGray,
        fontSize: 16,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Get.toNamed("main/profile/$pageRoute"),
      title: _buildTitle(),
      isThreeLine: true,
      subtitle: _buildDescription(),
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
      contentPadding: const EdgeInsets.symmetric(vertical: 15),
    );
  }
}
