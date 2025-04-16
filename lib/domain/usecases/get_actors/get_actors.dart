

import 'package:flix_id/data/repositories/movie_repository.dart';
import 'package:flix_id/domain/entities/actor.dart';
import 'package:flix_id/domain/entities/result.dart';
import 'package:flix_id/domain/usecases/get_actors/get_actors_param.dart';
import 'package:flix_id/domain/usecases/usecase.dart';

class GetActors implements Usecase<Result<List<Actor>>, GetActorsParam> {

  final MovieRepository _movieRepository;

  GetActors(this._movieRepository);

  @override
  Future<Result<List<Actor>>> call(GetActorsParam params) async {
    var actorListResult = await _movieRepository.getActor(id: params.movieId);

    return switch (actorListResult) {
      Success(value: final actorList) => Result.success(actorList),
      Failed(:final message) => Result.failed(message)
    };
  }

}