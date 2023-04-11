class RoutePoint {
  late String routeId;
  late String name;
  late String fare;
  late String stop;

  RoutePoint(
      {this.routeId = "", this.name = "", this.fare = "", this.stop = ""});

  RoutePoint.fromJson(Map<String, dynamic> json) {
    routeId = json["routeId"];
    name = json["name"];
    fare = json["fare"];
    stop = json["stop"];
  }
}
