import 'package:contacts_hive/cubit/contact_cubit.dart';
import 'package:contacts_hive/models/contact_model.dart';
import 'package:contacts_hive/views/edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactItem extends StatefulWidget {
  const ContactItem({super.key, required this.contact, required this.index});

  final ContactModel contact;
  final int index;

  @override
  State<ContactItem> createState() => _ContactItemState();
}

class _ContactItemState extends State<ContactItem> {
  List<ContactModel> contacts = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactCubit, ContactState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<ContactCubit>(context);
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditContactScreen(
                  contact: widget.contact,
                  index: widget.index,
                ),
              ),
            );
          },
          child: Container(
            color: Colors.blue[50],
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.contact.name,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      widget.contact.phone,
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    cubit.deleteContact(widget.index);
                  },
                  icon: const Icon(
                    Icons.delete_outline,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
