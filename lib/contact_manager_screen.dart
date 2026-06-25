import 'package:flutter/material.dart';

class ContactManagerScreen extends StatefulWidget {
  const ContactManagerScreen({super.key});

  @override
  State<ContactManagerScreen> createState() =>
      _ContactManagerScreenState();
}

class _ContactManagerScreenState
    extends State<ContactManagerScreen> {

  final TextEditingController nameController =
      TextEditingController();

  final TextEditingController phoneController =
      TextEditingController();

  List<Map<String, String>> contacts = [];

  void saveContact() {
    if (nameController.text.isNotEmpty &&
        phoneController.text.isNotEmpty) {

      setState(() {
        contacts.add({
          'name': nameController.text,
          'phone': phoneController.text,
        });
      });

      nameController.clear();
      phoneController.clear();
    }
  }

  void deleteContact(int index) {
    setState(() {
      contacts.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Emergency Contacts"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Contact Name",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: "Phone Number",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            ElevatedButton(
              onPressed: saveContact,
              child: const Text("Save Contact"),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.person),
                      title: Text(
                        contacts[index]['name']!,
                      ),
                      subtitle: Text(
                        contacts[index]['phone']!,
                      ),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          deleteContact(index);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}