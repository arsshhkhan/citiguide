import 'package:flutter/material.dart';

textfield(
    {required TextEditingController controller,
    required String label,
    required IconData icon,
    required bool obs,
    Color iconColor = Colors.blue}) {
  return TextFormField(
    controller: controller,
    obscureText: obs,
    decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    validator: (value) {
      if (value!.isEmpty ) {
        return "invalid " + label;
      } else {
        return null;
      }
    },
  );
}

materialbutton(
    {required Function() function,
    required String btnText,
    required Color btnColor}) {
  return MaterialButton(
    onPressed: () {
      return function();
    },
    child: Text(btnText),
    color: btnColor,
  );
}

textbutton({required String text, required void Function() function}) {
  return TextButton(
    child: Text(text),
    onPressed: () {
      function();
    },
  );
}

sizedbox() {
  return SizedBox(
    height: 10,
  );
}
