import 'package:flutter/material.dart';
import 'package:flutter_mini_projects/pages/cart_logic_page/models/product_model.dart';
import 'package:flutter_mini_projects/properties/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({required this.product, required this.ontap, super.key});

  final ProductModel product;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding:  EdgeInsets.only(bottom:12.h),
        child: Card(
          elevation: 2,
          color: CartLogicColor.secondaryColor,
          child: ListTile(
            minVerticalPadding: 12.h,
            leading: product.image != null
                ? Image.asset(
                    product.image!,
                    width: 70.w,
                    height: 70.w,
                  )
                : Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 12.w),
                  child: const Icon(
                      FontAwesomeIcons.bowlFood,
                      size: 50,
                    ),
                ),
            title: Text(
              product.name ?? '-',
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.type ?? '-',
                  style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: CartLogicColor.hintColor,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Rp ${product.price}',
                        style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
