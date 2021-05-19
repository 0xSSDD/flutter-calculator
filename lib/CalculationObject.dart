class CalculationObject {
  String key;
  String result;


  CalculationObject.fromJson(Map<String, dynamic> responseBody) {
    key = responseBody['key'];
    result = responseBody['result'];

  }

  Map<String, dynamic> toJson() {
    Map<String,dynamic> json = Map();
    json['key'] = key;
    json['result'] = result;
    return json;
  }


}