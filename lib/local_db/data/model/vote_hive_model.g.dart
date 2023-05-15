// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vote_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VoteHiveAdapter extends TypeAdapter<VoteHive> {
  @override
  final int typeId = 2;

  @override
  VoteHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VoteHive(
      whoIsVoting: fields[0] as int?,
      whoIsVoted: fields[1] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, VoteHive obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.whoIsVoting)
      ..writeByte(1)
      ..write(obj.whoIsVoted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VoteHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
