import 'package:contacts_hive/constants.dart';
import 'package:contacts_hive/cubit/contact_cubit.dart';
import 'package:contacts_hive/models/contact_model.dart';
import 'package:contacts_hive/views/contacts_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ContactModelAdapter());
  await Hive.openBox<ContactModel>(contactsBoxName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactCubit()..getContacts(),
      child: const MaterialApp(
        home: ContactsScreen(),
      ),
    );
  }
}
