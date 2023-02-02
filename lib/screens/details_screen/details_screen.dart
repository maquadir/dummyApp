import 'dart:developer';

import 'package:flutter/material.dart';

import '../../util/app_bar.dart';
import '../../util/indicators.dart';
import '../../util/screen_arguments.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late PageController _pageController;
  int activePage = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
          child: Container(
        color: Colors.amber,
        padding: EdgeInsets.all(20),
        child: displayProductDetails(args, context),
      )),
    );
  }

  Center displayProductDetails(ScreenArguments args, BuildContext context) {
    return Center(
        child: Column(children: [
      Image.network(args.products?.thumbnail ?? ""),
      Column(children: [
        buildSizedBox(context, args),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: indicators(args.products?.images?.length, activePage))
      ]),
      Padding(padding: EdgeInsets.all(20)),
      Text('Product : ${args.products?.title}'),
      Text('Brand : ${args.products?.brand}'),
      Text('Category : ${args.products?.category}'),
      Text('Description : ${args.products?.description}'),
      Text('Discount % : ${args.products?.discountPercentage}'),
      Text('Price : ${args.products?.price}'),
      Text('Rating : ${args.products?.rating}'),
      Text('Stock : ${args.products?.stock}'),
    ]));
  }

  SizedBox buildSizedBox(BuildContext context, ScreenArguments args) {
    return SizedBox(
        height: 200,
        width: MediaQuery.of(context).size.width,
        child: PageView.builder(
            itemCount: args.products?.images?.length,
            pageSnapping: true,
            controller: _pageController,
            onPageChanged: (page) {
              setState(() {
                activePage = page;
              });
            },
            itemBuilder: (context, pagePosition) {
              return Container(
                  margin: EdgeInsets.all(10),
                  child: Image.network(
                      args.products?.images![pagePosition] ?? ""));
            }));
  }
}
