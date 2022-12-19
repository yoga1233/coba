import 'package:coba/app/styles/colors.dart';
import 'package:coba/app/styles/styles.dart';
import 'package:coba/app/utils/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class PopularCategoryItemShimmer extends StatelessWidget {
  const PopularCategoryItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SizedBox(
        width: 150.w,
        height: 231.h,
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 55.h),
              width: 150.w,
              height: 176.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: const Color(0xffF1F1F1),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 50.r,
                      backgroundColor: AppColors.lightGreyColor,
                    ),
                  ),
                  verticalSpace(14.h),
                  Container(
                    height: 20.h,
                    width: 100.w,
                    color: AppColors.lightGreyColor,
                  ),
                  verticalSpace(16.h),
                  Text(
                    'Time',
                    style: TextStyles.regular
                        .copyWith(fontSize: 12.w, color: AppColors.greyColor),
                  ),
                  verticalSpace(4.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 20.h,
                        width: 50.w,
                        color: AppColors.lightGreyColor,
                      ),
                      Container(
                        padding: EdgeInsets.all(6.w),
                        decoration: const BoxDecoration(
                          color: AppColors.whiteColor,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          AppAsset.icon('BookmarkInactive.png'),
                          width: 16.w,
                          height: 16.w,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
