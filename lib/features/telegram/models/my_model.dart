import 'package:equatable/equatable.dart';

class MyModel extends Equatable {
  const MyModel({
    this.id = -1,
    this.myName = '',
  });

  final int id;
  final String myName;

  MyModel copyWith({
    String? myName,
  }) {
    return MyModel(
      id: id,
      myName: myName ?? this.myName,
    );
  }

  @override
  List<Object> get props => [
        id,
        myName,
      ];
}
