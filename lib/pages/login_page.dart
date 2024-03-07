import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({super.key, this.title = 'User Form'});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16)
            .copyWith(bottom: MediaQuery.of(context).padding.bottom),
        child: Column(
          children: [
            const SizedBox(height: 20),
            SizedBox(
              width: double.maxFinite,
              child: TextField(
                controller: firstNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'First Name',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.maxFinite,
              child: TextField(
                controller: lastNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Last Name',
                ),
              ),
            ),
            const Expanded(child: SizedBox.shrink()),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0), child:
                FilledButton(
                  onPressed: _showHelloDialog,
                  child: const Text('ZDAROVA, PUCKICH!'),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _showHelloDialog() {
    String firstName = firstNameController.text;
    String lastName = lastNameController.text;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('ZDAROVA, PUCKICH!'),
        content: Text('ZDAROVA, PUCKICH $firstName $lastName'),
      ),
    );
  }
}
