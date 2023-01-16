import 'package:flutter_bloc_plus_freezed/domain/entities/hand_entity.dart';

abstract class GetCardsHandUseCaseInterface {

  Future<HandEntity> getCards();
}
