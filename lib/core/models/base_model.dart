abstract class IBaseModel<T> {
  Map<String, dynamic> toJson();
  List<T> fromJson(String jsonData);
  T fromString(Map jsonData);
  T fromJsonMap(Map json);
}
