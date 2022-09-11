import '../../../../domain/models/profile_list_item_model.dart';
import '../../../manager/profile_controller.dart';
import '/core/utils/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'profile_list_item.dart';

class ProfileBody extends GetWidget<ProfileController> {
  const ProfileBody({Key? key}) : super(key: key);

  Widget _buildUserInfo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: Get.width * .1,
          backgroundImage: const AssetImage("assets/images/profile.jpg"),
        ),
        const HorizontalSpace(15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            CustomText(
              "Matilda Brown",
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
            VerticalSpace(12),
            CustomText("matildabrown@mail.com",color: colorGray,)
          ],
        )
      ],
    );
  }

  Widget _buildSections() {
    return ListView.separated(
      itemCount: controller.sections.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        ProfileListItemModel item = controller.sections[index];
        return ProfileListItem(
          title: item.title,
          description: item.description,
          pageRoute: item.route,
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(
          color: colorGray,
        );
      },
    );
  }

  Widget _buildBody() {
    return Flex(
      direction: Axis.vertical,
      mainAxisSize: MainAxisSize.max,
      children: [
        const CustomPageHeader("My Profile"),
        _buildUserInfo(),
        VerticalSpace(Get.height * .03),
        SizedBox(
          height: Get.height * .6,
          child: _buildSections(),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: CustomWidgets.screenPadding,
      child: _buildBody(),
    );
  }
}
