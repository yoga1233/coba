import 'package:coba/app/styles/colors.dart';
import 'package:coba/app/styles/styles.dart';
import 'package:coba/app/utils/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class TrendingNowItemShimmer extends StatelessWidget {
  const TrendingNowItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: 280.w,
                  height: 180.h,
                  color: AppColors.lightGreyColor,
                ),
              ),
              Positioned(
                top: 8.h,
                left: 8.w,
                child: Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xff303030).withOpacity(0.3),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        AppAsset.icon('Star.png'),
                        width: 15.w,
                        height: 18.h,
                      ),
                      horizontalSpace(3),
                      Text(
                        'rating',
                        style: TextStyles.title.copyWith(
                          fontSize: 14.w,
                          height: 1.4,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 8.h,
                right: 8.w,
                child: Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: const BoxDecoration(
                    color: AppColors.whiteColor,
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    width: 14.w,
                    height: 18.h,
                    color: AppColors.greyColor,
                  ),
                ),
              )
            ],
          ),
          verticalSpace(10.h),
          SizedBox(
            width: 280.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Text shimer
                Container(
                  height: 20.h,
                  width: 130.w,
                  decoration: BoxDecoration(
                    color: AppColors.lightGreyColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                Image.asset(
                  AppAsset.icon('More-1.png'),
                  width: 20.w,
                  height: 20.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
