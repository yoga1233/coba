import 'package:coba/app/styles/colors.dart';
import 'package:coba/app/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class DetailImageShimmer extends StatelessWidget {
  const DetailImageShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: 375.w,
        height: 320.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 13.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Container(
                width: 343.w,
                height: 200.h,
                color: AppColors.whiteColor,
              ),
            ),
            verticalSpace(16.h),
            Container(
              width: 120.w,
              height: 19.w,
              color: AppColors.whiteColor,
            ),
            verticalSpace(16.h),
            Row(
              children: [
                CircleAvatar(
                  radius: 20.r,
                  backgroundColor: AppColors.whiteColor,
                ),
                horizontalSpace(8.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 70.w,
                      height: 16.h,
                      color: AppColors.whiteColor,
                    ),
                    verticalSpace(3.w),
                    Container(
                      width: 150.w,
                      height: 16.h,
                      color: AppColors.whiteColor,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
