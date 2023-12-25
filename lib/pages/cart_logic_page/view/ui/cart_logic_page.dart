import 'package:flutter/material.dart';
import 'package:flutter_mini_projects/pages/cart_logic_page/controller/cart_logic_controller.dart';
import 'package:flutter_mini_projects/pages/cart_logic_page/view/components/product_card.dart';
import 'package:flutter_mini_projects/pages/cart_logic_page/view/ui/cart_page.dart';
import 'package:flutter_mini_projects/pages/cart_logic_page/view/ui/product_detail.dart';
import 'package:flutter_mini_projects/properties/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CartLogicPage extends StatelessWidget {
  const CartLogicPage({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(CartLogicController());
    return Scaffold(
      backgroundColor: CartLogicColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: CartLogicColor.backgroundColor,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            c.getProduct();
          },
          child: const Icon(
            FontAwesomeIcons.gripLines,
            color: Colors.black,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              c.calculateGrandTotal();
              Get.to(const CartPage());
            },
            child: Padding(
              padding: EdgeInsets.only(right: 12.w),
              child: const Icon(
                FontAwesomeIcons.cartShopping,
                color: Colors.black,
                size: 18,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.w),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
            color: CartLogicColor.secondaryColor,
            borderRadius: BorderRadius.circular(20.r)),
        child: GNav(
          rippleColor: Colors.grey, // tab button ripple color when pressed
          hoverColor: Colors.grey, // tab button hover color
          haptic: true, // haptic feedback
          tabBorderRadius: 15,
          curve: Curves.easeInOut, // tab animation curves
          duration: const Duration(milliseconds: 500), // tab animation duration
          gap: 6, // the tab button gap between icon and text
          color: CartLogicColor.hintColor, // unselected icon color
          activeColor:
              CartLogicColor.primaryColor, // selected icon and text color
          iconSize: 20, // tab button icon size
          tabBackgroundColor: CartLogicColor.primaryColor
              .withOpacity(0.1), // selected tab background color
          padding: const EdgeInsets.symmetric(
              horizontal: 20, vertical: 10), // navigation bar padding
          tabs: const [
            GButton(
              icon: FontAwesomeIcons.home,
              text: 'Home',
            ),
            GButton(
              icon: FontAwesomeIcons.heart,
              text: 'Likes',
            ),
            GButton(
              icon: FontAwesomeIcons.search,
              text: 'Search',
            ),
            GButton(
              icon: FontAwesomeIcons.person,
              text: 'Profile',
            ),
          ],
        ),
      ),
      body: GetBuilder<CartLogicController>(builder: (context) {
        return Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                decoration: BoxDecoration(
                    color: CartLogicColor.secondaryColor,
                    borderRadius: BorderRadius.circular(12.r)),
                child: TextField(
                  controller: c.searchC,
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  style: GoogleFonts.poppins(),
                  decoration: InputDecoration(
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: 'Search',
                    hintStyle: GoogleFonts.poppins(
                      color: CartLogicColor.hintColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    suffixIcon: const Icon(
                      FontAwesomeIcons.search,
                      size: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              TabBar(
                isScrollable: true,
                controller: c.tabController,
                indicatorColor: CartLogicColor.primaryColor,
                labelColor: CartLogicColor.primaryColor,
                unselectedLabelColor: CartLogicColor.hintColor,
                tabs: c.listCategory
                    .map(
                      (e) => Tab(
                        child: Text(
                          e.name!,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Popular Food',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              c.listProduct != null || (c.listProduct ?? []).isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: c.listProduct!.length,
                        itemBuilder: (context, index) {
                          var product = c.listProduct![index];
                          return ProductCard(
                            product: product,
                            ontap: () {
                              c.selectedPrice = product.price ?? 0;
                              Get.to(ProductDetail(product: product));
                            },
                            addCartAction: () {
                              c.addCard(product);
                            },
                          );
                        },
                      ),
                    )
                  : const SizedBox()
            ],
          ),
        );
      }),
    );
  }
}
