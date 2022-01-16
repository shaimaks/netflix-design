import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class LoadImage extends StatelessWidget {
  const LoadImage(
      {Key key,
       this.image,
      this.fit = BoxFit.cover,
      this.disableClick = false,
      this.isProfilePicture = false})
      : super(key: key);

  final String image;
  final bool disableClick;
  final BoxFit fit;
  final bool isProfilePicture;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: disableClick == false ? false : true,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Get.theme.colorScheme.background,
        ),
        child: CachedNetworkImage(
          imageUrl: image,
          fit: fit,
          filterQuality: FilterQuality.medium,
          errorWidget: (context, url, error) => Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: Icon(
              isProfilePicture ? Icons.person : Icons.now_wallpaper,
              color: Colors.grey,
              size: 50,
            ),
          ),
          placeholder: (context, url) => const LoadingWidget(center: true),
        ),
      ),
    );
  }
}
class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key key, this.center = false}) : super(key: key);

  final bool center;

  @override
  Widget build(BuildContext context) {
    return center
        ? Container(
        color: Colors.transparent,
        child: const Center(child: CircularProgressIndicator()))
        : const CircularProgressIndicator();
  }
}