import 'package:coba/app/styles/colors.dart';
import 'package:coba/app/styles/styles.dart';
import 'package:coba/app/utils/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonText extends StatelessWidget {
  const ButtonText({super.key, required this.onTap});

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Text(
            'See all',
            style: TextStyles.title
                .copyWith(fontSize: 14.w, color: AppColors.primaryColor),
          ),
          horizontalSpace(3.w),
          Image.asset(
            AppAsset.icon('Arrow-Right.png'),
            width: 20.w,
            height: 20.w,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
