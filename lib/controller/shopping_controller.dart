import 'package:get/get.dart';
import 'package:getx/models/product.dart';

class ShoppingController extends GetxController {
  List<Product> productData = [];
  List<Product> cartItem = List<Product>.empty().obs;

  addtocart(Product item){
    cartItem.add(item);
  }

  double get totalprice => cartItem.fold(0, (sum, item) => sum + item.price);
  int get count => cartItem.length;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));
    List<Product> serverResponse = [
      Product(
        id: 1,
        productName: 'T-Shirt',
        productImage: 'assets/images/t-shirt.png',
        productDescription: 'some description about product',
        price: 250, favorite: false,
      ),
      Product(
        id: 2,
        productName: 'Jeans',
        productImage: 'assets/images/jeans.png',
        productDescription: 'some description about product',
        price: 1200, favorite: false,
      ),
      Product(
        id: 3,
        productName: 'Shoes',
        productImage: 'assets/images/shoe.png',
        productDescription: 'some description about product',
        price: 2000, favorite: false,
      ),
    ];
    productData.assignAll(serverResponse);
    update();
  }
  addToFavorites(id){
    var index = productData.indexWhere((element) => element.id ==id);
    productData[index].favorite =  !productData[index].favorite;
    update();
  }
}
