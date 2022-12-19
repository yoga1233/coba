import 'package:coba/app/routes/app_pages.dart';
import 'package:coba/app/styles/colors.dart';
import 'package:coba/app/styles/styles.dart';
import 'package:coba/app/utils/app_asset.dart';
import 'package:coba/app/utils/extension/ext_string.dart';
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
    this.onTap,
    required this.favIcon,
  });
  final String tittle;
  final String imageUrl;
  final String rating;
  final String favIcon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Stack(
              children: [
                InkWell(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    Get.toNamed(Routes.DETAIL_RECIPE, arguments: tittle);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LoadImage(
                      height: 180.h,
                      width: 280.w,
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
                        Image.asset(
                          AppAsset.icon('Star.png'),
                          width: 15.w,
                          height: 18.h,
                        ),
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
              width: 280.w,
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
          ],
        ),
        Positioned(
          top: 8.h,
          right: 8.w,
          child: InkWell(
            onTap: onTap,
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
        )
      ],
    );
  }
}
