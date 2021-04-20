import 'package:calculator_floor/helpers/parse_helper.dart';
import 'package:calculator_floor/models/floor_model.dart';
import 'package:calculator_floor/models/result_model.dart';
import 'package:calculator_floor/models/room_model.dart';

class CalculatorController {
  final RoomModel _room = RoomModel();
  final FloorModel _floor = FloorModel();

  void setRoomWidth(String value) {
    _room.width = ParseHelper.toDouble(value);
  }
  void setRoomlength(String value) {
    _room.lenght = ParseHelper.toDouble(value);
  }
  void setFloorWidth(String value) {
    _room.width = ParseHelper.toDouble(value);
  }
  void setfloorLength(String value) {
    _room.lenght = ParseHelper.toDouble(value);
  }

  void setPrice(String value) {
    _floor.price = ParseHelper.toDouble(value);
  }

ResultModel calculate() {
  return ResultModel(
    piecesByWidth:  (_room.width / _floor.width).ceil(),
    piecesByLength: (_room.lenght / _floor.lenght).ceil(),
    areaFloor: _floor.width * _floor.width,
    priceByArea: _floor.price,
  );
  }
}