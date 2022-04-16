import 'package:daberli/layers/domain/entity/dto/basket/add/add_basket_product_dto.dart';
import 'package:daberli/layers/domain/entity/dto/basket/get/product_from_basket_dto.dart';
import 'package:daberli/layers/domain/entity/dto/basket/update/update_baskets_product.dart';
import 'package:daberli/layers/domain/entity/dto/slots/slot_dto.dart';
import 'package:daberli/layers/domain/entity/models/error/base/either.dart';
import 'package:daberli/layers/domain/entity/models/error/base/failure.dart';

abstract class BasketRepository {
  Future<Either<Failure, SlotDto>> getVendorSlots(int vendor, String? token);

  Future<Either<Failure, UpdateBasketsProductDTO>> updateProduct(
      int productId, UpdateBasketsProductDTO product, String? token);

  Future<Either<Failure, void>> deleteCartsProduct(
      int productId, String? token);

  Future<Either<Failure, void>> deleteCart(int productId, String? token);

  Future<Either<Failure, AddBasketProductDTO>> addProductToBasket(
      AddBasketProductDTO product, String? token);

  Future<Either<Failure, List<ProductFromBasketDto>>> getBasketProducts(
      String? token);
}
