import 'package:coba/app/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardRecipe extends StatelessWidget {
  const CardRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16.w),
      height: 190.h,
      width: 124.w,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Image.network(
              'https://i.ibb.co/S32HNjD/no-image.jpg',
              width: 124.w,
              height: 124.w,
              fit: BoxFit.fill,
            ),
          ),
          verticalSpace(8.h),
          Flexible(
            child: Text(
              'Kelewele Ghanian Recipe',
              style: TextStyles.title.copyWith(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
