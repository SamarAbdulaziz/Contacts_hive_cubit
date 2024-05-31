part of 'contact_cubit.dart';

@immutable
sealed class ContactState {}

final class ContactInitial extends ContactState {}

final class ContactAddedSuccess extends ContactState {}

final class ContactAddedFailure extends ContactState {}

final class ContactGetSuccess extends ContactState {
  final List<ContactModel> contactsList;

  ContactGetSuccess({required this.contactsList});
}

final class ContactGetFailure extends ContactState {}

final class ContactDeletedSuccess extends ContactState {}

final class ContactDeletedFailure extends ContactState {}

final class ContactEditedSuccess extends ContactState {}

final class ContactEditedFailure extends ContactState {}
