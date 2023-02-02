import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextFormField extends FormField<String>{
  MyTextFormField({
    Key? key,
    String? initialValue,
    required String txtInPut,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    AutovalidateMode autovalidateMode = AutovalidateMode.onUserInteraction,
    bool enabled = true,
    bool request = false,
    Widget? suffix,
  }): super(
      key: key,
      validator: validator,
      onSaved: onSaved,
      initialValue: initialValue,
      autovalidateMode: autovalidateMode,
      builder: (FormFieldState state) {
        return TextField(
          onChanged: (text) {
            state.didChange(text);
          },
          style: Theme.of(state.context).textTheme.bodyText2,
          decoration: InputDecoration().applyDefaults(Theme.of(state.context).inputDecorationTheme).copyWith(
            hintStyle:TextStyle(color: Color(0xff9586a8), fontSize: 14, fontFamily: 'SFProRegular', fontWeight: FontWeight.normal),

            errorText: state.errorText,
              hintText: txtInPut,
              suffixIcon: suffix,
              border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Color(0xffd9d0e3), width: 1)
        ),
        enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Color(0xffd9d0e3), width: 1)
        ),
        focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Color(0xffd9d0e3), width: 1)
        ),
            contentPadding: EdgeInsets.symmetric( vertical: 13, horizontal: 13),
          ),
        );
      });
}