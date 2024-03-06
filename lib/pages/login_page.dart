import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({super.key, this.title = 'User Form'});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController firstNamecontroller = TextEditingController();
  TextEditingController lastNamecontroller = TextEditingController();

  @override
  void dispose() {
    firstNamecontroller.dispose();
    lastNamecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),  
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 40,
                height: 60,
                child: TextField(
                  controller: firstNamecontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'First Name',
                    ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 40,
                height: 60,
                child: TextField(
                  controller: lastNamecontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Last Name',
                  ),
                ),
              ),
            ],
          ),
          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FilledButton(
                onPressed: () {
                  String firstName = firstNamecontroller.text;
                  String lastName = lastNamecontroller.text;
                  showDialog(
                    context: context, 
                    builder: (context) => 
                      AlertDialog(
                        title: const Text('ZDAROVA, PUCKICH!'),
                        content: Text('ZDAROVA, PUCKCH $firstName $lastName'),
                      ),
                  );  
                }, 
                child: const Text('ZDAROVA, PUCKICH!'),
                ),
              const SizedBox(height: 20,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}