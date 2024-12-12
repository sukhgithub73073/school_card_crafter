import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:card_craft/src/core/app_colors.dart';
import 'package:card_craft/src/core/app_image_view.dart';
import 'package:card_craft/src/core/app_text_style.dart';
import 'package:card_craft/src/core/text_view.dart';
import 'package:card_craft/src/data/models/product_model.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;

  const ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colorCard,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 12.w,
            bottom: 12.h,
            child: CircleAvatar(
              radius: 18.r,
              backgroundColor: colorPrimary,
              child: const Icon(Icons.add_rounded, color: Colors.white),
            ),
          ),
          Positioned(
            child: true
                ? ImageView(

                    url: product.thumbnail,
                    imageType: ImageType.network,
                    height: 180,

                  )
                : Image.asset(product.thumbnail),
          ),
          Positioned(
            left: 16.w,
            bottom: 24.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  text: product.title,
                  color: colorBlack,
                  textSize: 15.sp,
                  textAlign: TextAlign.center,
                  style: AppTextStyleEnum.title,
                  fontFamily: Family.bold,
                  lineHeight: 1.3,
                ),
                5.verticalSpace,
                TextView(
                  text: '₹ ${product.price}',
                  color: colorRed,
                  textSize: 14.sp,
                  textAlign: TextAlign.center,
                  style: AppTextStyleEnum.title,
                  fontFamily: Family.bold,
                  lineHeight: 1.3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
