import 'package:contacts_hive/cubit/contact_cubit.dart';
import 'package:contacts_hive/views/form_screen.dart';
import 'package:contacts_hive/views/widgets/contact_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactCubit, ContactState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {

        var cubit=BlocProvider.of<ContactCubit>(context);
        return Scaffold(
          appBar: AppBar(),
          body: ListView.builder(
            itemCount: cubit.contacts.length,
            itemBuilder: (context, index) =>
                ContactItem(index: index, contact:  cubit.contacts[index]),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FormScreen(),
                  // maintainState: false
                ),
              );
            },
            backgroundColor: Colors.blue[300],
            child: const Icon(
              Icons.add,
            ),
          ),
        );
      },
    );
  }
}
