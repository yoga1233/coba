import 'package:coba/app/modules/home/controllers/home_controller.dart';
import 'package:coba/app/styles/styles.dart';
import 'package:coba/app/utils/extension/ext_string.dart';
import 'package:coba/app/widgets/others/load_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CardRecent extends GetView<HomeController> {
  const CardRecent({
    super.key,
    required this.label,
    required this.imageUrl,
    this.onTap,
  });
  final String label;
  final String imageUrl;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16.w),
      height: 190.h,
      width: 124.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: onTap,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: LoadImage(
                width: 124.w,
                height: 124.w,
                imageUrl: imageUrl,
              ),
            ),
          ),
          verticalSpace(8.h),
          Flexible(
            child: Text(
              label.isJudul(),
              style: TextStyles.title.copyWith(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
