import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String label;
  final TextInputType keyboardtype;
  final bool obscuretext, borderenabled;
  final double fontsize;
  final void Function(String text)? onChanged;
  final String? Function(String?)? validator;
  final Color color;
  final Color labelcolor;

  const InputText({
    super.key,
    this.label = '',
    this.keyboardtype = TextInputType.text,
    this.obscuretext = false,
    this.borderenabled = true,
    this.fontsize = 15,
    this.onChanged,
    this.validator,
    this.color = Colors.black,
    this.labelcolor = Colors.black45,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardtype,
      obscureText: obscuretext,
      onChanged: onChanged,
      validator: validator,
      style: TextStyle(
        fontSize: fontsize,
        color: color,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 5),
        enabledBorder: borderenabled
            ? const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white24),
              )
            : InputBorder.none,
        labelText: label,
        labelStyle: TextStyle(
          color: labelcolor, 
          fontWeight: FontWeight.w500
        ),
      ),
    );
  }
}
