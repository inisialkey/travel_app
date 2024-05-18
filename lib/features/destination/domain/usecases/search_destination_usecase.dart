import '../../../../core/error/failures.dart';
import '../entities/destination_entity.dart';
import '../repositories/destination_repository.dart';
import 'package:dartz/dartz.dart';

class SearchDestinationUseCase {
  final DestinationRepository _repository;

  SearchDestinationUseCase(this._repository);

  Future<Either<Failure, List<DestinationEntity>>> call(String query) {
    return _repository.search(query);
  }
}
