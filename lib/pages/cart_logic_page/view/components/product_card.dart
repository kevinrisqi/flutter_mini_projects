import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mini_projects/pages/cart_logic_page/controller/cart_logic_controller.dart';
import 'package:flutter_mini_projects/pages/cart_logic_page/models/product_model.dart';
import 'package:flutter_mini_projects/properties/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    required this.product,
    required this.ontap,
    this.addCartAction,
    super.key,
  })  : isProductCart = false,
        addQty = null,
        minQty = null;

  const ProductCard.cart({
    required this.product,
    required this.ontap,
    required this.addQty,
    required this.minQty,
    super.key,
  })  : addCartAction = null,
        isProductCart = true;

  final ProductModel product;
  final Function() ontap;
  final Function()? addCartAction;
  final bool isProductCart;
  final Function()? addQty;
  final Function()? minQty;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: EdgeInsets.only(bottom: 12.h),
        child: Card(
          elevation: 2,
          color: Colors.white,
          child: ListTile(
            minVerticalPadding: 16.h,
            leading: product.image != null
                ? product.image!.contains('http')
                    ? CachedNetworkImage(
                        imageUrl: product.image!,
                        width: 70.w,
                        height: 70.w,
                        placeholder: (context, url) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      )
                    : Image.asset(
                        product.image!,
                        width: 70.w,
                        height: 70.w,
                      )
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: const Icon(
                      FontAwesomeIcons.bowlFood,
                      size: 50,
                    ),
                  ),
            title: Text(
              product.title ?? '-',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(
                //   product.category?[''] ?? '-',
                //   style: GoogleFonts.poppins(
                //     fontSize: 12.sp,
                //     fontWeight: FontWeight.w500,
                //     color: CartLogicColor.hintColor,
                //   ),
                // ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Rp ${product.price}',
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: !isProductCart,
                      child: InkWell(
                        onTap: addCartAction,
                        child: Container(
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
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Visibility(
                  visible: isProductCart,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: minQty,
                        child: Container(
                          width: 18.w,
                          height: 18.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: CartLogicColor.secondaryColor,
                          ),
                          child: const Center(
                            child: Icon(
                              FontAwesomeIcons.minus,
                              size: 14,
                            ),
                          ),
                        ),
                      ),
                      GetBuilder<CartLogicController>(builder: (context) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: Text(
                            product.quantity.toString(),
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600, fontSize: 16.sp),
                          ),
                        );
                      }),
                      InkWell(
                        onTap: addQty,
                        child: Container(
                          width: 18.w,
                          height: 18.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: CartLogicColor.primaryColor,
                          ),
                          child: const Center(
                            child: Icon(
                              FontAwesomeIcons.plus,
                              size: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
