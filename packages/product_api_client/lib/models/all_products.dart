

class AllProducts {
  List<FullProduct>? products;
  int? total;
  int? skip;
  int? limit;

  AllProducts({ this.products, this.total, this.skip, this.limit});

}

class FullProduct {
  int? id;
  String? title;
  String? description;
  int? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<String>? images;

  FullProduct(
      {this.id,
        this.title,
        this.description,
        this.price,
        this.discountPercentage,
        this.rating,
        this.stock,
        this.brand,
        this.category,
        this.thumbnail,
        this.images});

}
