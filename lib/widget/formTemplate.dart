import 'package:flutter/material.dart';

class FormTemplate extends StatelessWidget {
  final String title;
  final GlobalKey<FormState> formKey;
  final List formFields;
  final String submitText;
  final Function onSubmit;

  const FormTemplate({
    this.title = "",
    this.formKey,
    this.formFields,
    this.submitText = "Mentés",
    this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if(title.isNotEmpty)
              Text(
                title,
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center,
              ),
              ...formFields,
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => onSubmit(),
                child: Text(submitText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
