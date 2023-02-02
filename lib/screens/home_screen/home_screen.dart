import 'package:app/screens/details_screen/details_screen.dart';
import 'package:dummy_api_client/models/product.dart';
import 'package:dummy_api_client/models/all_products.dart';
import 'package:dummy_api_client/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:result_type/result.dart';

import '../../util/app_bar.dart';
import '../../util/routes.dart';
import '../../util/screen_arguments.dart';

// Renders a home screen
class HomeScreen extends StatefulWidget {
  final ProductApiService productApiService;

  const HomeScreen({
    Key? key,
    this.productApiService = const ProductApiService(),
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

/// [HomeScreen] state
class _HomeScreenState extends State<HomeScreen> {

  AllProducts? _productList = AllProducts();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _onLoad();
  }

  void _onLoad() async => _onGetProducts();

  void _onGetProducts() async {
    Result<AllProducts> getAllProductsResult =
    await widget.productApiService.getAllProducts();
    if (getAllProductsResult.hasValue) {
      setState(() {
        _isLoading = false;
        _productList = getAllProductsResult.value!;
      });
    } else if (getAllProductsResult.hasError) {
      _productList = null;
    }
  }

  void deleteProduct(int productIdToDelete) async {
    Result<Product> deleteProduct =
    await widget.productApiService.deleteProduct(
        id: productIdToDelete.toString());
    if (deleteProduct.hasValue) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Product has been deleted"),
      ));
    } else if (deleteProduct.hasError) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Something went wrong.Please try again"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) => _buildScaffold(context);

  Widget _buildScaffold(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: !_isLoading
          ? (_productList?.products != null
          ? displayProducts(context)
          : displayServerError())
          : Center(child: const CircularProgressIndicator()),
    );
  }

  Center displayServerError() {
    return Center(
        child: const Text("There was an error getting values",
            style: TextStyle(fontSize: 22)));
  }

  Widget displayProducts(BuildContext context) {
    return ((_productList?.products?.length == 0)
        ? Center(
        child: const Text("There are no products to display",
            style: TextStyle(fontSize: 22)))
        : _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: _productList?.products!.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        return displayProductTile(index, context);
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  GestureDetector displayProductTile(int index, BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 50,
        color: Colors.amber,
        child: Center(
            child: Text('Entry ${_productList?.products![index].title}')),
      ),
      onTap: () =>
      {
        Navigator.pushNamed(context, Routes.details,
            arguments: ScreenArguments(_productList?.products![index]))
      },
      onLongPress: () => {showAlertDialog(context, _productList, index)},
    );
  }

  showAlertDialog(BuildContext context, AllProducts? productList, int index) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("Continue"),
      onPressed: () {
        int id = _productList?.products![index].id ?? 0;
        deleteProduct(id);
        productList?.products?.removeAt(index);
        setState(() {
          _productList = productList;
        });
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("AlertDialog"),
      content: Text("Would you like to continue deleting this product ?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
