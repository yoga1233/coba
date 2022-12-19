import 'package:coba/app/styles/styles.dart';
import 'package:coba/app/widgets/buttons/button_text.dart';
import 'package:coba/app/widgets/cards/card_recipe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecentRecipes extends StatelessWidget {
  const RecentRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.w, bottom: 3),
      height: 258.h,
      width: 375.w,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent recipe',
                  style: TextStyles.title.copyWith(fontSize: 20.w),
                ),
                ButtonText(onTap: () {}),
              ],
            ),
          ),
          verticalSpace(16.h),
          SizedBox(
            height: 190.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return const CardRecipe();
              },
            ),
          )
        ],
      ),
    );
  }
}
