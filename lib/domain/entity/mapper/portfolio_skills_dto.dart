import 'package:daberli/layers/domain/base/mapper_contract.dart';
import 'package:daberli/layers/domain/entity/dto/orders/orders_list/order_dto.dart';
import 'package:daberli/layers/domain/entity/models/orders/orders_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: Mapper<OrderDTO, OrdersModel>)
class OrderMapper extends Mapper<OrderDTO, OrdersModel> {

  OrderMapper(this.statusMapper);

  final Mapper<List<OrderStatus>, OrderStatusShort> statusMapper;

  @override
  OrdersModel mapToModel(OrderDTO dto) {
    return OrdersModel(
      next: dto.next,
      previous: dto.previous,
      results: (dto.results?.isEmpty ?? true) ? null : List.generate(dto.results?.length ?? 0, (index) {
        return OrderProductModel(
          id: dto.results?[index].id ?? -1,
          photo: dto.results?[index].vendor?.shopLogo ?? '',
          phoneNumber: dto.results?[index].vendor?.contactPhone ?? dto.results?[index].vendor?.contactSecondPhone ?? '',
          date: dto.results?[index].created ?? DateTime.now(),
          title: dto.results?[index].vendor?.name ?? '',
          orderStatus: statusMapper.mapToModel([dto.results!.first.status ?? OrderStatus.newOrder]),
          hasReview: dto.results?[index].hasReview ?? false
        );
      })
    );
  }

  @override
  OrderDTO mapToDto(OrdersModel model) {
    // TODO: implement mapToDto
    throw UnimplementedError();
  }
}
