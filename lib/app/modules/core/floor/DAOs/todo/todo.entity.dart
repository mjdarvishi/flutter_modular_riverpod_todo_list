import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@entity
class TodoEntity extends Equatable{
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String name;
  final String des;
  final String date;

  const TodoEntity(this.name, this.des, this.date,{this.id});

  @override
  List<Object?> get props =>[id,name,des,date];
}