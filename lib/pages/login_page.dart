import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({super.key, this.title = 'User Form'});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // эти поля должны быть помечены как final, тк изменять их ты не будешь.
  // Их имена должны следовать lowerCamelCase, то есть firstNameController
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
        // Кнопка с иконкой назад появится в АппБаре сама по себе,
        // если навигация Назад возможна =)
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16)
            .copyWith(bottom: MediaQuery.of(context).padding.bottom),
        child: Column(
          children: [
            // Если убрать запятую, то этот маленький виджет станет в одну строку
            const SizedBox(height: 20),
            // Не используй Row для одного элемента внутри
            SizedBox(
              // Для отступов используй виджет Padding,
              // Длина виджета не должна управлять отступами.
              // width: MediaQuery.of(context).size.width - 40,
              width: double.maxFinite,
              // Подобными виджетам высота явно не задается
              // height: 60,
              child: TextField(
                controller: firstNamecontroller,
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
                controller: lastNamecontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Last Name',
                ),
              ),
            ),
            const Expanded(child: SizedBox.shrink()),
            FilledButton(
              // Функции лучше выносить за пределы верстки.
              onPressed: _showHelloDialog,
              child: const Text('ZDAROVA, PUCKICH!'),
            ),
          ],
        ),
      ),
    );
  }

  void _showHelloDialog() {
    String firstName = firstNamecontroller.text;
    String lastName = lastNamecontroller.text;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('ZDAROVA, PUCKICH!'),
        content: Text('ZDAROVA, PUCKCH $firstName $lastName'),
      ),
    );
  }
}
