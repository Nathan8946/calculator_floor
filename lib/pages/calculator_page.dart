import 'package:calculator_floor/controllers/calculator_controller.dart';
import 'package:calculator_floor/widgets/number_input_field.dart';
import 'package:calculator_floor/widgets/primary_button.dart';
import 'package:calculator_floor/widgets/text_header.dart';

import '../widgets/result_dialog.dart';

import '../core/constants.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final _controller = CalculatorController();
  final _formKey = GlobalKey<FormState>();  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kAppTitle),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Container(
          padding: EdgeInsets.all(kSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextHeader(label: kEnvironmentHeader),
              SizedBox(height: kSpace),
              NumberInputField(
                label: '$kWidth ($kMeters)',
                onSaved: _controller.setRoomWidth,
                ),
              SizedBox(height: kSpace),
              NumberInputField(
                label: '$kLength ($kMeters)',
                onSaved: _controller.setRoomlength,
                ),
              SizedBox(height: kBigSpace),
              TextHeader(label: kFloorHeader),
              SizedBox(height: kSpace),
              NumberInputField(
                label: '$kWidth ($kMeters)',
                onSaved: _controller.setRoomWidth,
                ),
              SizedBox(height: kSpace),
              NumberInputField(
                label: '$kLength ($kMeters)',
                onSaved: _controller.setRoomlength,
                ),
              SizedBox(height: kSpace),
              TextHeader(label: kPriceTitle),
              SizedBox(height: kSpace),
              NumberInputField(
                label: '$kPrice ($kMoney)',
                onSaved: _controller.setPrice,
                ),
              SizedBox(height: kBigSpace),
              PrimaryButton(
                label: kCalculateButton,
                onPressed: _onCalculate,
              ),
               SizedBox(height: kBigSpace),
              PrimaryButton(
                label: kClearButton,
                onPressed: _onReset,
              ),
            ],
          )
        );
  }

  void _onCalculate() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      final result = _controller.calculate();
      ResultDialog.show(context, result);
  }
  }

  void _onReset() {
    _formKey.currentState.reset();
  }
}

