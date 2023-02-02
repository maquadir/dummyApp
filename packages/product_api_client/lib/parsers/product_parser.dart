import 'dart:convert';
import 'dart:developer';
import 'package:dummy_api_client/models/product.dart';
import 'package:dummy_api_client/models/all_products.dart';

import '../models/all_products.dart';

/// JSON parser for [Product]
class ProductParser {
  ProductParser();

  static Product parse(String jsonString) {
    dynamic jsonObj = json.decode(jsonString);
    return Product(
      id: jsonObj['id'],
      title: jsonObj['title'],
      price: jsonObj['price'],
      thumbnail: jsonObj['thumbnail'],
    );
  }

  static AllProducts parseList(String jsonString) {
    List<FullProduct> products = <FullProduct>[];
    dynamic jsonObj = json.decode(jsonString);
    if (jsonObj['products'] != null) {
      jsonObj['products'].forEach((v) {
        products.add(FullProduct(
            id: v['id'],
            title: v['title'],
            description: v['description'],
            price: v['price'],
            discountPercentage: v['discountPercentage'],
            rating: v['rating'].toDouble(),
            stock: v['stock'],
            brand: v['brand'],
            category: v['category'],
            thumbnail: v['thumbnail'],
            images: v['images'].cast<String>()));
      });
    }
    return AllProducts(
      products: products,
      total: jsonObj['total'],
      skip: jsonObj['skip'],
      limit: jsonObj['limit'],
    );
  }
}
