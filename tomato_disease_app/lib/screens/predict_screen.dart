import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tomato_disease_app/services/prediction_service.dart';

class PredictScreen extends StatefulWidget {
  const PredictScreen({super.key});

  @override
  State<PredictScreen> createState() => _PredictScreenState();
}

class _PredictScreenState extends State<PredictScreen> {
  bool _isLoading = true;
  Map<String, dynamic>? _result;
  String _errorMessage = '';
  late String _imagePath;
  late String _language;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    _imagePath = args['imagePath'];
    _language = args['language'] ?? 'en';
    _runPrediction();
  }

  Future<void> _runPrediction() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    final result = await PredictionService.predict(File(_imagePath));

    setState(() {
      _isLoading = false;
      if (result.containsKey('error')) {
        _errorMessage = result['error'];
      } else {
        _result = result;
      }
    });

    if (_result != null && mounted) {
      Navigator.pushReplacementNamed(
        context,
        '/result',
        arguments: {
          'prediction': _result!['prediction'],
          'confidence': _result!['confidence'],
          'top3': _result!['top3'],
          'imagePath': _imagePath,
          'language': _language,
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B5E20),
        foregroundColor: Colors.white,
        title: const Text('Analyzing...'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image preview
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.file(
                  File(_imagePath),
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 40),

              if (_isLoading) ...[
                const CircularProgressIndicator(
                  color: Color(0xFF1B5E20),
                  strokeWidth: 3,
                ),
                const SizedBox(height: 20),
                Text(
                  _language == 'en'
                      ? 'Analyzing your plant...'
                      : _language == 'hi'
                          ? 'आपके पौधे का विश्लेषण हो रहा है...'
                          : 'तुमच्या झाडाचे विश्लेषण होत आहे...',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF1B5E20),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  _language == 'en'
                      ? 'This will take a few seconds'
                      : _language == 'hi'
                          ? 'इसमें कुछ सेकंड लगेंगे'
                          : 'यास काही सेकंद लागतील',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                ),
              ],

              if (_errorMessage.isNotEmpty) ...[
                const Icon(Icons.error_outline, color: Colors.red, size: 48),
                const SizedBox(height: 16),
                Text(
                  _errorMessage,
                  style: const TextStyle(color: Colors.red, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1B5E20),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Go Back'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
