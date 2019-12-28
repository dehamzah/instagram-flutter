List<double> getAlignmentPosition(
  double x,
  double y,
  double screenWidth,
  double screenHeight,
) {
  double alignmentX = (x - (screenWidth / 2)) / (screenWidth / 2);
  double alignmentY = (y - (screenHeight / 2)) / (screenHeight / 2);

  return [alignmentX, alignmentY];
}
