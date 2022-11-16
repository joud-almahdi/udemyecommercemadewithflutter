import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:udemyecommerce/Model/productmodel.dart';
import 'package:udemyecommerce/Services/product_services.dart';

class ProductController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    List? storedShoppings = storage.read<List>('isFavouritesList');

    if (storedShoppings != null) {
      favouritesList =
          storedShoppings.map((e) => ProductModel.fromJson(e)).toList().obs;
    }
    getProducts();
  }

  var productlist = <ProductModel>[].obs;
  var isLoading = true.obs;
  var favouritesList = <ProductModel>[].obs;
  var isfavorites = false.obs;
  // var stoarge = GetStorage();
  var searchList = <ProductModel>[].obs;
  var storage = GetStorage();
  TextEditingController searchTextController = TextEditingController();

  void getProducts() async {
    var products = await ProductServices.getProduct();

    try {
      isLoading(true);
      if (products.isNotEmpty) {
        productlist.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

  void manageFavourites(int productId) async {
    var existingIndex =
        favouritesList.indexWhere((element) => element.id == productId);

    if (existingIndex >= 0) {
      favouritesList.removeAt(existingIndex);
      await storage.remove("isFavouritesList");
    } else {
      favouritesList
          .add(productlist.firstWhere((element) => element.id == productId));

      await storage.write("isFavouritesList", favouritesList);
    }
  }

  bool isFavourites(int productId) {
    return favouritesList.any((element) => element.id == productId);
  }

//Search Bar Logic

  void addSearchToList(String searchName) {
    searchName = searchName.toLowerCase();

    searchList.value = productlist.where((search) {
      var searchTitle = search.title.toLowerCase();
      var searchPrice = search.price.toString().toLowerCase();

      return searchTitle.contains(searchName) ||
          searchPrice.toString().contains(searchName);
    }).toList();

    update();
  }

  void clearSearch() {
    searchTextController.clear();
    addSearchToList("");
  }

  void addfavorites() {
    isfavorites.value = !isfavorites.value;
  }
}
