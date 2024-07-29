import 'package:bijak/core/models/product_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final RxList<ProductModel> cart = RxList([]);

  RxString total = RxString("");
  RxString items = RxString("");

  void addToCart(ProductModel model) {
    cart.add(model);
    model.isAdded.value = true;
    getTotalPrice();
  }

  void increaseQuantity(ProductModel model) {
    cart.firstWhere((e) => e.id == model.id).quantity.value++;
    getTotalPrice();
  }

  void decreaseQuantity(ProductModel model) {
    final prod = cart.firstWhere((e) => e.id == model.id);
    if (prod.quantity.value > 1) {
      cart.firstWhere((e) => e.id == model.id).quantity.value--;
    } else {
      cart.remove(prod);
      prod.isAdded.value = false;
    }
    getTotalPrice();
  }

  void getTotalPrice() {
    num total = 0;
    int qty = 0;
    for (var e in cart) {
      total += (e.price * e.quantity.value);
      qty += e.quantity.value;
    }
    this.total.value = total.toStringAsFixed(2);
    items.value = qty.toString();
  }
}
