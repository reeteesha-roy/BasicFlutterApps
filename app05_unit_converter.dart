import 'package:flutter/material.dart';

void main() {
  runApp(const UnitConverterApp());
}

class UnitConverterApp extends StatelessWidget {
  const UnitConverterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unit Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const UnitConverterScreen(),
    );
  }
}

class UnitConverterScreen extends StatefulWidget {
  const UnitConverterScreen({Key? key}) : super(key: key);

  @override
  State<UnitConverterScreen> createState() => _UnitConverterScreenState();
}

class _UnitConverterScreenState extends State<UnitConverterScreen> {
  // Controller for the input field
  final TextEditingController _inputController = TextEditingController();

  // Available units for conversion
  final List<String> _units = ['Meter', 'Kilometer', 'Centimeter', 'Mile', 'Foot'];

  // Default selected units
  String _fromUnit = 'Meter';
  String _toUnit = 'Kilometer';

  // Result of conversion
  String _result = '';

  // Convert the value from one unit to another
  void _convertUnit() {
    // Check if input is empty
    if (_inputController.text.isEmpty) {
      setState(() {
        _result = 'Please enter a value';
      });
      return;
    }

    // Try to parse the input value
    double? value = double.tryParse(_inputController.text);
    if (value == null) {
      setState(() {
        _result = 'Please enter a valid number';
      });
      return;
    }

    // Convert to meters first (base unit)
    double inMeters;
    switch (_fromUnit) {
      case 'Meter':
        inMeters = value;
        break;
      case 'Kilometer':
        inMeters = value * 1000;
        break;
      case 'Centimeter':
        inMeters = value / 100;
        break;
      case 'Mile':
        inMeters = value * 1609.34;
        break;
      case 'Foot':
        inMeters = value * 0.3048;
        break;
      default:
        inMeters = value;
    }

    // Convert from meters to the target unit
    double convertedValue;
    switch (_toUnit) {
      case 'Meter':
        convertedValue = inMeters;
        break;
      case 'Kilometer':
        convertedValue = inMeters / 1000;
        break;
      case 'Centimeter':
        convertedValue = inMeters * 100;
        break;
      case 'Mile':
        convertedValue = inMeters / 1609.34;
        break;
      case 'Foot':
        convertedValue = inMeters / 0.3048;
        break;
      default:
        convertedValue = inMeters;
    }

    // Update the result with formatted number
    setState(() {
      _result = '${value.toString()} $_fromUnit = ${convertedValue.toStringAsFixed(4)} $_toUnit';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unit Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Input field for entering value
            TextField(
              controller: _inputController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter value',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Row for "From" unit selection
            Row(
              children: [
                const Text('From: ', style: TextStyle(fontSize: 16)),
                const SizedBox(width: 10),
                Expanded(
                  child: DropdownButton<String>(
                    value: _fromUnit,
                    isExpanded: true,
                    items: _units.map<DropdownMenuItem<String>>((String unit) {
                      return DropdownMenuItem<String>(
                        value: unit,
                        child: Text(unit),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          _fromUnit = newValue;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Row for "To" unit selection
            Row(
              children: [
                const Text('To: ', style: TextStyle(fontSize: 16)),
                const SizedBox(width: 10),
                Expanded(
                  child: DropdownButton<String>(
                    value: _toUnit,
                    isExpanded: true,
                    items: _units.map<DropdownMenuItem<String>>((String unit) {
                      return DropdownMenuItem<String>(
                        value: unit,
                        child: Text(unit),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          _toUnit = newValue;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Convert button
            ElevatedButton(
              onPressed: _convertUnit,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text('Convert', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 30),

            // Result display
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                _result.isEmpty ? 'Result will appear here' : _result,
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
