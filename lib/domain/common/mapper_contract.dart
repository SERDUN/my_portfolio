abstract class Mapper<D, M> {
  M mapToModel(D dto);

  D mapToDto(M model);

  List<M> mapToModels(List<D> dto) => dto.map((e) => mapToModel(e)).toList();

  List<D> mapToDTOs(List<M> dto) => dto.map((e) => mapToDto(e)).toList();
}
