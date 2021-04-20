class ResultModel {
  double areaFloor;
  int piecesByLength;
  int piecesByWidth;
  double priceByArea;

  ResultModel ({
    this.areaFloor = 0.0,
    this.piecesByLength = 0,
    this.piecesByWidth = 0,
    this.priceByArea = 0.0,
  });

  int get amountPieces => piecesByLength * piecesByWidth;
  int get amountFooter => piecesByLength + piecesByWidth;
  int get amountPiecesandFoorter => amountPieces + amountFooter;
  double get areaWithoutFooter => amountPieces * areaFloor;
  double get areaWithFooter => amountPiecesandFoorter * areaFloor;
  double get priceWithoutFooter => areaWithoutFooter * priceByArea;
  double get priceWithFooter => areaWithFooter * priceByArea;

}