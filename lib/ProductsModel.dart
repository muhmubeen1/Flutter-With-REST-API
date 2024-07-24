class ProductsModel {
  bool? success;
  String? message;
  List<Product>? data;

  ProductsModel({this.success, this.message, this.data});

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      success: json['success'],
      message: json['message'],
      data: (json['data'] as List).map((i) => Product.fromJson(i)).toList(),
    );
  }
}

class Product {
  String? id;
  bool? onSale;
  int? salePercent;
  int? sold;
  bool? sliderNew;
  bool? sliderRecent;
  bool? sliderSold;
  String? date;
  String? title;
  Category? categories;
  Subcategory? subcat;
  Shop? shop;
  String? price;
  String? saleTitle;
  String? salePrice;
  String? description;
  String? color;
  String? size;
  bool? inWishlist;
  List<ImageInfo>? images;

  Product({
    this.id,
    this.onSale,
    this.salePercent,
    this.sold,
    this.sliderNew,
    this.sliderRecent,
    this.sliderSold,
    this.date,
    this.title,
    this.categories,
    this.subcat,
    this.shop,
    this.price,
    this.saleTitle,
    this.salePrice,
    this.description,
    this.color,
    this.size,
    this.inWishlist,
    this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'],
      onSale: json['on_sale'],
      salePercent: json['sale_percent'],
      sold: json['sold'],
      sliderNew: json['slider_new'],
      sliderRecent: json['slider_recent'],
      sliderSold: json['slider_sold'],
      date: json['date'],
      title: json['title'],
      categories: Category.fromJson(json['categories']),
      subcat: Subcategory.fromJson(json['subcat']),
      shop: Shop.fromJson(json['shop']),
      price: json['price'],
      saleTitle: json['sale_title'],
      salePrice: json['sale_price'],
      description: json['description'],
      color: json['color'],
      size: json['size'],
      inWishlist: json['in_wishlist'],
      images:
          (json['images'] as List).map((i) => ImageInfo.fromJson(i)).toList(),
    );
  }
}

class Category {
  String? id;
  String? type;
  int? salePercent;
  String? date;
  String? name;
  String? image;

  Category({
    this.id,
    this.type,
    this.salePercent,
    this.date,
    this.name,
    this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'],
      type: json['type'],
      salePercent: json['sale_percent'],
      date: json['date'],
      name: json['name'],
      image: json['image'],
    );
  }
}

class Subcategory {
  String? id;
  String? type;
  int? salePercent;
  String? date;
  String? name;

  Subcategory({
    this.id,
    this.type,
    this.salePercent,
    this.date,
    this.name,
  });

  factory Subcategory.fromJson(Map<String, dynamic> json) {
    return Subcategory(
      id: json['_id'],
      type: json['type'],
      salePercent: json['sale_percent'],
      date: json['date'],
      name: json['name'],
    );
  }
}

class Shop {
  String? id;
  bool? isActive;
  String? createdAt;
  String? name;
  String? description;
  String? shopEmail;
  String? shopAddress;
  String? shopCity;
  String? userId;
  String? image;

  Shop({
    this.id,
    this.isActive,
    this.createdAt,
    this.name,
    this.description,
    this.shopEmail,
    this.shopAddress,
    this.shopCity,
    this.userId,
    this.image,
  });

  factory Shop.fromJson(Map<String, dynamic> json) {
    return Shop(
      id: json['_id'],
      isActive: json['is_active'],
      createdAt: json['created_At'],
      name: json['name'],
      description: json['description'],
      shopEmail: json['shopemail'],
      shopAddress: json['shopaddress'],
      shopCity: json['shopcity'],
      userId: json['userid'],
      image: json['image'],
    );
  }
}

class ImageInfo {
  String? id;
  String? url;

  ImageInfo({this.id, this.url});

  factory ImageInfo.fromJson(Map<String, dynamic> json) {
    return ImageInfo(
      id: json['id'],
      url: json['url'],
    );
  }
}
