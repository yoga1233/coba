import 'package:coba/app/routes/app_pages.dart';
import 'package:coba/app/styles/colors.dart';
import 'package:coba/app/styles/styles.dart';
import 'package:coba/app/utils/app_asset.dart';
import 'package:coba/app/utils/extension/ext_string.dart';
import 'package:coba/app/utils/custom_icons.dart';
import 'package:coba/app/widgets/others/load_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CardFoods extends StatelessWidget {
  const CardFoods({
    super.key,
    required this.tittle,
    this.imageUrl = 'https://i.ibb.co/S32HNjD/no-image.jpg',
    required this.rating,
    this.onTapFavIcon,
    required this.favIcon,
    this.height,
    this.width,
    this.marginBottom,
    this.onTapImage,
  });
  final String tittle;
  final String imageUrl;
  final String rating;
  final String favIcon;
  final double? height;
  final double? width;
  final double? marginBottom;
  final Function()? onTapFavIcon;
  final Function()? onTapImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Stack(
              children: [
                InkWell(
                  onTap: onTapImage,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LoadImage(
                      height: height ?? 180.h,
                      width: width ?? 280.w,
                      imageUrl: imageUrl,
                    ),
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
                        Icon(
                          CustomIcons.star,
                          size: 16.w,
                        ),
                        // Image.asset(
                        //   AppAsset.icon('Star.png'),
                        //   width: 15.w,
                        //   height: 18.h,
                        // ),
                        horizontalSpace(3),
                        Text(
                          rating,
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
              ],
            ),
            verticalSpace(10.h),
            SizedBox(
              width: width ?? 280.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      tittle.isJudul(),
                      overflow: TextOverflow.clip,
                      style: TextStyles.subTitle,
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
            verticalSpace(marginBottom ?? 0)
          ],
        ),
        Positioned(
          top: 8.h,
          right: 8.w,
          child: InkWell(
            onTap: onTapFavIcon,
            child: Container(
              padding: EdgeInsets.all(8.w),
              decoration: const BoxDecoration(
                color: AppColors.whiteColor,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                AppAsset.icon(favIcon),
                width: 14.w,
                height: 18.h,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
