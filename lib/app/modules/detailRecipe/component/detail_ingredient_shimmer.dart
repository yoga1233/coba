import 'package:coba/app/styles/colors.dart';
import 'package:coba/app/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class DetailIngredienteShimmer extends StatelessWidget {
  const DetailIngredienteShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 20.h,
                  width: 150.w,
                  color: AppColors.whiteColor,
                ),
                Container(
                  height: 25,
                  width: 50,
                  color: AppColors.whiteColor,
                ),
              ],
            ),
            verticalSpace(13.h),
            Container(
              width: 343.w,
              height: 76.h,
              margin: EdgeInsets.only(bottom: 13.h),
              color: AppColors.whiteColor,
            ),
            Container(
              width: 343.w,
              height: 76.h,
              margin: EdgeInsets.only(bottom: 13.h),
              color: AppColors.whiteColor,
            ),
            Container(
              width: 343.w,
              height: 76.h,
              margin: EdgeInsets.only(bottom: 13.h),
              color: AppColors.whiteColor,
            )
          ],
        ),
      ),
    );
  }
}
