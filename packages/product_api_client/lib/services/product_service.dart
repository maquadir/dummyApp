import 'dart:developer';

import 'package:dummy_api_client/models/all_products.dart';
import 'package:dummy_api_client/models/product.dart';
import 'package:dummy_api_client/parsers/product_parser.dart';
import 'package:http_api_client/services/http_api_service.dart';
import 'package:result_type/result.dart';

import '../util/constant.dart';

/// Provides product API services
class ProductApiService {
  /// Creates a product API service
  const ProductApiService();

  /// Returns [Product] details for the given [id] of product
  /// or an error [Result] on failure.
  Future<Result<Product>> getProduct({required String id}) async {
    final httpResult = await HttpApiService().httpGet(Uri.parse(
      AppConstants.getAllProducts + '/$id',
    ));

    if (httpResult.hasError) {
      return Result(
        error: httpResult.error,
      );
    }

    Product parseResult = ProductParser.parse(
      httpResult.value ?? '',
    );

    return Result(
      value: parseResult,
    );
  }

  Future<Result<AllProducts>> getAllProducts() async {
    final httpResult =
        await HttpApiService().httpGet(Uri.parse(AppConstants.getAllProducts));

    if (httpResult.hasError) {
      return Result(
        error: httpResult.error,
      );
    }

    AllProducts parseResult = ProductParser.parseList(
      httpResult.value ?? '',
    );

    return Result(
      value: parseResult,
    );
  }

  Future<Result<Product>> deleteProduct({required String id}) async {
    final httpResult = await HttpApiService()
        .httpDelete(Uri.parse(AppConstants.deleteProduct + '/$id'),);

    log('httpResulterror: ${httpResult.error}');

    if (httpResult.hasError) {
      return Result(
        error: httpResult.error,
      );
    }

    Product parseResult = ProductParser.parse(
      httpResult.value ?? '',
    );

    return Result(
      value: parseResult,
    );
  }
}
