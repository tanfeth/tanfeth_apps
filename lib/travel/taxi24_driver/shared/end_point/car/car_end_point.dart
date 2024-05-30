

class CarEndPoints {
  final String car ;
  const CarEndPoints({
    this.car = "/Car",
  });
  String get addCar => car;
  String get getCar => car + "/user-cars";
  String get deleteCar => car;
  String get uploadCarDocument => car + "/registration-insurance";
  String get setDefault => car + "/status";
}
