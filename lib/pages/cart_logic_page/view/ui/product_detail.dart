import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mini_projects/pages/cart_logic_page/controller/cart_logic_controller.dart';
import 'package:flutter_mini_projects/pages/cart_logic_page/models/product_model.dart';
import 'package:flutter_mini_projects/properties/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({required this.product, super.key});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final c = Get.put(CartLogicController());
    return GetBuilder<CartLogicController>(builder: (context) {
      return Scaffold(
        backgroundColor: CartLogicColor.backgroundColor,
        appBar: AppBar(
          backgroundColor: CartLogicColor.backgroundColor,
          elevation: 0,
          leading: InkWell(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.chevron_left,
              color: Colors.black,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 12.w),
              child: const Icon(
                FontAwesomeIcons.gripVertical,
                color: Colors.black,
                size: 18,
              ),
            ),
          ],
        ),
        bottomSheet: Container(
          padding: EdgeInsets.all(16.w),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Price',
                          style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: CartLogicColor.hintColor,
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          'Rp. ${c.selectedPrice.toInt()}',
                          style: GoogleFonts.poppins(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 50.w,
                    height: 50.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: CartLogicColor.secondaryColor,
                    ),
                    child: const Center(
                      child: Icon(
                        FontAwesomeIcons.heart,
                        size: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Container(
                    width: 50.w,
                    height: 50.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: CartLogicColor.primaryColor,
                    ),
                    child: const Center(
                      child: Icon(
                        FontAwesomeIcons.cartShopping,
                        size: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title ?? '',
                  style: GoogleFonts.poppins(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  product.description ?? '',
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    color: CartLogicColor.hintColor,
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                product.image != null
                    ? product.image!.contains('http')
                        ? Center(
                            child: CachedNetworkImage(
                              imageUrl: product.image!,
                              width: 250.w,
                              height: 250.w,
                            ),
                          )
                        : Center(
                            child: Image.asset(
                              product.image!,
                              width: 250.w,
                              height: 250.w,
                            ),
                          )
                    : Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: const Icon(
                            FontAwesomeIcons.bowlFood,
                            size: 130,
                          ),
                        ),
                      ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  'Size',
                  style: GoogleFonts.poppins(),
                ),
                SizedBox(
                  height: 4.h,
                ),
                TabBar(
                  isScrollable: true,
                  controller: c.tabSizeC,
                  indicatorColor: Colors.transparent,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: c.listSize
                      .map(
                        (e) => Tab(
                            child: Container(
                          width: 42.w,
                          height: 42.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: c.tabSizeC.index == c.listSize.indexOf(e)
                                ? CartLogicColor.primaryColor
                                : CartLogicColor.secondaryColor,
                          ),
                          child: Center(
                            child: Text(
                              e,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        )),
                      )
                      .toList(),
                ),
                SizedBox(
                  height: 16.h,
                ),
                const Text('Quantity'),
                SizedBox(
                  height: 4.h,
                ),
                SizedBox(
                  width: 1.sw / 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () => c.decrementQty(product.price!),
                        child: Container(
                          width: 30.w,
                          height: 30.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: CartLogicColor.secondaryColor,
                          ),
                          child: const Center(
                            child: Icon(
                              FontAwesomeIcons.minus,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        c.qty.toString(),
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600, fontSize: 16.sp),
                      ),
                      InkWell(
                        onTap: () => c.incrementQty(product.price!),
                        child: Container(
                          width: 30.w,
                          height: 30.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: CartLogicColor.primaryColor,
                          ),
                          child: const Center(
                            child: Icon(
                              FontAwesomeIcons.plus,
                              size: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 125.h,
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
