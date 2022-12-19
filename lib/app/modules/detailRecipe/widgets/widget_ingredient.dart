import 'package:coba/app/styles/styles.dart';
import 'package:coba/app/widgets/others/load_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WidgetIngredient extends StatelessWidget {
  const WidgetIngredient({
    super.key,
    required this.imageUrl,
    required this.label,
  });
  final String imageUrl;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 76.h,
      margin: EdgeInsets.only(bottom: 13.h),
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffF1F1F1),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: LoadImage(
              imageUrl: imageUrl,
              width: 52.w,
              height: 52.w,
            ),
          ),
          horizontalSpace(16.w),
          Flexible(
            child: Text(
              label,
              overflow: TextOverflow.clip,
              style: TextStyles.subTitle,
            ),
          ),
        ],
      ),
    );
  }
}
