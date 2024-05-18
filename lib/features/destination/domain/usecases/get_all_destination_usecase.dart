import '../../../../core/error/failures.dart';
import '../entities/destination_entity.dart';
import '../repositories/destination_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllDestinationUseCase {
  final DestinationRepository _repository;

  GetAllDestinationUseCase(this._repository);

  Future<Either<Failure, List<DestinationEntity>>> call() {
    return _repository.all();
  }
}
