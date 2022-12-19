import 'package:coba/app/styles/colors.dart';
import 'package:coba/app/styles/styles.dart';
import 'package:coba/app/utils/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputSearch extends StatelessWidget {
  const InputSearch({super.key, this.controller, this.margin, this.padding});

  final TextEditingController? controller;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.symmetric(
        vertical: 12.h,
        horizontal: 16.w,
      ),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        border: Border.all(
          color: AppColors.lightGreyColor,
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Image.asset(
              AppAsset.icon('Search.png'),
              width: 20.w,
              height: 20.h,
            ),
          ),
          Expanded(
            child: TextFormField(
              style: TextStyles.regular,
              decoration: InputDecoration.collapsed(
                filled: true,
                fillColor: Colors.transparent,
                hoverColor: Colors.transparent,
                hintText: 'Search Recipes',
                hintStyle: TextStyles.regular.copyWith(
                  color: AppColors.greyColor,
                  height: 1.4,
                ),
              ),
              onFieldSubmitted: (value) {},
            ),
          ),
        ],
      ),
    );
  }
}
