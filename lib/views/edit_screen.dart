import 'package:contacts_hive/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/contact_cubit.dart';

class EditContactScreen extends StatefulWidget {
  const EditContactScreen({
    super.key,
    required this.contact,
    required this.index,
  });

  final ContactModel contact;
  final int index;

  @override
  State<EditContactScreen> createState() => _EditContactScreenState();
}

class _EditContactScreenState extends State<EditContactScreen> {
  String? name, phone;

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ContactCubit>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(
              Icons.check,
              size: 36,
            ),
            onPressed: () {
              ContactModel contact = ContactModel(
                name: cubit.nameController.text,
                phone: cubit.phoneController.text,
              );
              cubit.editContact(
                contact: contact,
                index: widget.index,
              );
              cubit.getContacts();
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          children: [
            TextFormField(
              controller: cubit.nameController..text = widget.contact.name,
              //initialValue: widget.contact.name,
              onChanged: (value) {
                if (value.isEmpty) {
                  name = value;
                  // cubit.nameController.text = value;
                } else {
                  name = widget.contact.name;
                }
              },
              decoration: const InputDecoration(
                label: Text(
                  'Name',
                ),
                hintText: 'Enter Name',
              ),
            ),
            TextFormField(
              controller: cubit.phoneController..text = widget.contact.phone,
              decoration: const InputDecoration(
                label: Text(
                  'phone',
                ),
                hintText: 'Enter phone',
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
