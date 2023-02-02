/// Represents a product
class Product {
  /// A unique id for this product
  final int id;

  /// Product title
  final String title;

  /// Price in dollars
  final int price;

  /// Thumbnail of product image
  final String thumbnail;

  /// Creates a product with given attributes
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.thumbnail,
  });
}
