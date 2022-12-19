import 'package:coba/app/styles/colors.dart';
import 'package:coba/app/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class DetailHeaderShimmer extends StatelessWidget {
  const DetailHeaderShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 29.h,
            width: 343.w,
            color: AppColors.whiteColor,
          ),
          verticalSpace(5.h),
          Container(
            height: 29.h,
            width: 100.w,
            color: AppColors.whiteColor,
          ),
        ],
      ),
    );
  }
}
