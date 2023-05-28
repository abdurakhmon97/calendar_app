part of '../bloc/edit_or_add_bloc.dart';

abstract class EditOrAddState extends Equatable {
  const EditOrAddState();
}

class EditOrAddInitial extends EditOrAddState {
  @override
  List<Object> get props => [];
}

class AddNewEventState extends EditOrAddState {
  @override
  List<Object?> get props => [];
}
