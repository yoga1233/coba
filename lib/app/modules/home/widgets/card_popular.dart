import 'package:coba/app/routes/app_pages.dart';
import 'package:coba/app/styles/colors.dart';
import 'package:coba/app/styles/styles.dart';
import 'package:coba/app/utils/app_asset.dart';
import 'package:coba/app/utils/extension/ext_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CardPopular extends StatelessWidget {
  const CardPopular({
    super.key,
    required this.imageUrl,
    required this.tittle,
    required this.time,
    required this.iconFav,
    required this.onTapIcon,
    required this.onTapImage,
  });

  final String imageUrl;
  final String tittle;
  final String time;
  final String iconFav;
  final Function() onTapIcon;
  final Function() onTapImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: onTapImage,
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
                          backgroundImage: NetworkImage(
                            imageUrl,
                          ),
                        ),
                      ),
                      verticalSpace(14.h),
                      Text(
                        tittle.isJudul(),
                        textAlign: TextAlign.center,
                        style: TextStyles.regular
                            .copyWith(fontWeight: FontWeights.semiBold),
                      ),
                      verticalSpace(16.h),
                      Text(
                        'Time',
                        style: TextStyles.regular.copyWith(
                          fontSize: 12.w,
                          color: AppColors.greyColor,
                        ),
                      ),
                      verticalSpace(4.h),
                      Text(
                        time,
                        textAlign: TextAlign.center,
                        style: TextStyles.regular
                            .copyWith(fontWeight: FontWeights.semiBold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 12.w,
          bottom: 40.h,
          child: InkWell(
            onTap: onTapIcon,
            child: Container(
              padding: EdgeInsets.all(6.w),
              decoration: const BoxDecoration(
                color: AppColors.whiteColor,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                AppAsset.icon(iconFav),
                width: 16.w,
                height: 16.w,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
