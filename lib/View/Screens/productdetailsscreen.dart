import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemyecommerce/Model/productmodel.dart';
import 'package:udemyecommerce/View/Widgets/ProductDetails/addcart.dart';
import 'package:udemyecommerce/View/Widgets/ProductDetails/clothesinfo.dart';
import 'package:udemyecommerce/View/Widgets/ProductDetails/sizelist.dart';

import '../Widgets/ProductDetails/imageslider.dart';

class Productdetails extends StatelessWidget {
  const Productdetails({required this.productmodel, super.key});
  final ProductModel productmodel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSliders(
                imageUrl: productmodel.image,
              ),
              ClothesInfo(
                title: productmodel.title,
                productId: productmodel.id,
                rate: productmodel.rating.rate,
                description: productmodel.description,
              ),
              const SizeList(),
              AddCart(
                price: productmodel.price,
                productModels: productmodel,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
