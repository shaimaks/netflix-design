import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AppBarCommon extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCommon(
      {Key key,
       this.titleString,
      this.autoImplies = true,
      this.actions,
      this.elevation = 0.0,
      this.titleSpacing,
      this.backgroundColor,
      this.isShareIcon = false,
      this.noActions = false,
      this.searchOnPress,
      this.shareOnPress})
      : super(key: key);

  final String titleString;
  final bool autoImplies;
  final List<Widget> actions;
  final double elevation;
  final double titleSpacing;
  final Color backgroundColor;
  final bool isShareIcon;
  final bool noActions;
  final Function() searchOnPress;
  final Function() shareOnPress;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: () { /* Write listener code here */ },
        child: Icon(
          Icons.menu,color: Colors.white, // add custom icons also
        ),
      ),
      titleSpacing: titleSpacing != null
          ? titleSpacing
          : autoImplies
              ? 0.0
              : 15.0,
      elevation: elevation,
      backgroundColor: backgroundColor ?? Get.theme.appBarTheme.backgroundColor,
      foregroundColor: backgroundColor ?? Get.theme.appBarTheme.backgroundColor,
      automaticallyImplyLeading: autoImplies,
      iconTheme: Get.theme.iconTheme,
      title: Text(
        titleString.tr,
        style: const TextStyle(fontSize: 16.0,color: Colors.white),
      ),
      // titleTextStyle:
      //     medium14.copyWith(color: Get.theme.colorScheme.onBackground),
      actions: [
          ...[
          Icon(Icons.notifications,color: Colors.white,)
          ].map((e) =>
              Padding(padding: const EdgeInsets.only(right: 2.0), child: e))
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height - 8);
}

