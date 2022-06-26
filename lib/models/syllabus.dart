class SyllabusResponse {
  SyllabusResponse({
    this.credits,
    this.module1,
    this.module2,
    this.module3,
    this.module4,
  });

  String? credits;
  String? module1;
  String? module2;
  String? module3;
  String? module4;
  factory SyllabusResponse.fromJson(Map<String, dynamic> json) =>
      SyllabusResponse(
        credits: json["Credits"],
        module1: json["Module1"],
        module2: json["Module2"],
        module3: json["Module3"],
        module4: json["Module4"],
      );
}
