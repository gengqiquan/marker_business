import 'package:json_annotation/json_annotation.dart';

part 'Model.g.dart';
///auther:gengqiquan
///date:2019/1/31
///description:Model

@JsonSerializable()
class Model extends Object with _$ModelSerializerMixin{

  @JsonKey(name: 'info')
  String info;

  @JsonKey(name: 'status')
  int status;

  Model(this.info,this.status,);

  factory Model.fromJson(Map<String, dynamic> srcJson) => _$ModelFromJson(srcJson);

}
