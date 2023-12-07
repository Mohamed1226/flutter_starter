/// This class represent the base form of DTO (Data transfer object)
abstract class BaseModel {
  const BaseModel();

  Map<String, dynamic> toJson();
}
