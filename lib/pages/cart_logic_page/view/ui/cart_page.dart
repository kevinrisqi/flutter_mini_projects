import 'package:flutter/material.dart';
import 'package:flutter_mini_projects/pages/cart_logic_page/controller/cart_logic_controller.dart';
import 'package:flutter_mini_projects/pages/cart_logic_page/view/components/product_card.dart';
import 'package:flutter_mini_projects/properties/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(CartLogicController());
    return Scaffold(
        backgroundColor: CartLogicColor.backgroundColor,
        bottomSheet: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.w),
          decoration: const BoxDecoration(color: Colors.white),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Grand Total',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Obx(
                      () => Text(
                        c.grandTotal.value.toString(),
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: CartLogicColor.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: CartLogicColor.primaryColor),
                child: const Text('Checkout'),
              )
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: CartLogicColor.backgroundColor,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.chevron_left,
              color: Colors.black,
            ),
          ),
          title: Text(
            'Cart (${c.listCart.length})',
            style: TextStyle(color: Colors.black, fontSize: 15.sp),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 12.w),
              child: const Icon(
                Icons.comment,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: c.listCart.length,
          padding: EdgeInsets.all(12.w),
          itemBuilder: (context, index) {
            var itemCart = c.listCart[index];
            return ProductCard.cart(
              product: itemCart,
              ontap: () {},
              addQty: () => c.addQtyCart(itemCart),
              minQty: () => c.minQtyCart(itemCart),
            );
          },
        ));
  }
}
