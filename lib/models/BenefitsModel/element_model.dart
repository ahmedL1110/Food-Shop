class BenefitsModel {
  dynamic benefit1;
  dynamic benefit2;
  dynamic benefit3;
  dynamic benefit4;
  dynamic benefit5;
  dynamic benefit6;
  dynamic benefit7;
  dynamic benefit8;

  BenefitsModel({
    this.benefit1,
    this.benefit2,
    this.benefit3,
    this.benefit4,
    this.benefit5,
    this.benefit6,
    this.benefit7,
    this.benefit8,
  });

  BenefitsModel.fromJson(Map<String, dynamic> json) {
    benefit1 = json['benefit1'];
    benefit2 = json['benefit2'];
    benefit3 = json['benefit3'];
    benefit4 = json['benefit4'];
    benefit5 = json['benefit5'];
    benefit6 = json['benefit6'];
    benefit7 = json['benefit7'];
    benefit8 = json['benefit8'];
  }

  Map<String, dynamic> toMap() {
    return {
      'benefit1': benefit1,
      'benefit2': benefit2,
      'benefit3': benefit3,
      'benefit4': benefit4,
      'benefit5': benefit5,
      'benefit6': benefit6,
      'benefit7': benefit7,
      'benefit8': benefit8,
    };
  }
}
