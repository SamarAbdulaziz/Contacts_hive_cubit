import 'package:contacts_hive/cubit/contact_cubit.dart';
import 'package:contacts_hive/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactCubit, ContactState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<ContactCubit>(context);
        cubit.nameController.clear();
        cubit.phoneController.clear();
        return Scaffold(
          appBar: AppBar(),
          body: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(35.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: cubit.nameController,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Field can not be empty';
                      } else {
                        return null;
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
                    controller: cubit.phoneController,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Field can not be empty';
                      } else {
                        return null;
                      }
                    },
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
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        ContactModel contact = ContactModel(
                            name: cubit.nameController.text,
                            phone: cubit.phoneController.text);

                        await cubit.addContact(contact).then((value) {
                          Navigator.pop(context);
                        });
                      } else {
                        autoValidateMode = AutovalidateMode.always;
                      }
                    },
                    child: const Text('Submit'),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
