import 'package:bloc/bloc.dart';
import 'package:contacts_hive/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../constants.dart';

part 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit() : super(ContactInitial());

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  var contactsBox = Hive.box<ContactModel>(contactsBoxName);

  Future<void> addContact(ContactModel contact) async {
    try {
      await contactsBox.add(contact);
      getContacts();
      emit(ContactAddedSuccess());
    } on Exception {
      emit(ContactAddedFailure());
    }
  }

  List<ContactModel> contacts = [];

  void getContacts() {
    try {
      contacts = contactsBox.values.toList();
      emit(ContactGetSuccess(contactsList: contacts));
    } on Exception {
      emit(ContactGetFailure());
    }
  }

  void deleteContact(int index) {
    try {
      contactsBox.deleteAt(index);
      contacts.removeAt(index);
      emit(ContactDeletedSuccess());
    } on Exception {
      emit(ContactDeletedFailure());
    }
  }

  void editContact({required ContactModel contact, required int index}) {
    try {
      contactsBox.putAt(index, contact);
      contacts[index] = contact;
      getContacts();
      emit(ContactEditedSuccess());
    } on Exception {
      emit(ContactEditedFailure());
    }
  }
}
