import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:tflite_flutter/tflite_flutter.dart';
import 'dart:convert';

class PredictionService {
  static Interpreter? _interpreter;
  static List<String>? _classNames;
  static const int imageSize = 224;

  static Future<void> initialize() async {
    await loadModel();
  }


  // Load model and class names
  static Future<void> loadModel() async {
    try {
      _interpreter = await Interpreter.fromAsset('assets/tomato_disease_model.tflite');

      final classNamesJson = await rootBundle.loadString('assets/class_names.json');
      _classNames = List<String>.from(jsonDecode(classNamesJson));

      print('Model loaded successfully');
      print('Classes: $_classNames');
    } catch (e) {
      print('Error loading model: $e');
    }
  }

  // Predict disease from image file
  static Future<Map<String, dynamic>> predict(File imageFile) async {
    if (_interpreter == null || _classNames == null) {
      await loadModel();
    }

    try {
      // Load and preprocess image
      final imageBytes = await imageFile.readAsBytes();
      img.Image? image = img.decodeImage(imageBytes);

      if (image == null) {
        return {'error': 'Could not decode image'};
      }

      // Resize to 224x224
      img.Image resized = img.copyResize(image, width: imageSize, height: imageSize);

      // Convert to float32 array normalized 0-1
      var inputArray = List.generate(
        1,
        (_) => List.generate(
          imageSize,
          (y) => List.generate(
            imageSize,
            (x) {
              final pixel = resized.getPixel(x, y);
              return [
                pixel.r / 255.0,
                pixel.g / 255.0,
                pixel.b / 255.0,
              ];
            },
          ),
        ),
      );

      // Output array
      var outputArray = List.generate(1, (_) => List.filled(_classNames!.length, 0.0));

      // Run inference
      _interpreter!.run(inputArray, outputArray);

      // Get predictions
      List<double> predictions = List<double>.from(outputArray[0]);

      // Get top 3 predictions
      List<MapEntry<int, double>> indexed = predictions
          .asMap()
          .entries
          .toList()
        ..sort((a, b) => b.value.compareTo(a.value));

      List<Map<String, dynamic>> top3 = indexed.take(3).map((e) {
        return {
          'class': _classNames![e.key],
          'confidence': e.value * 100,        // ✅ double
          'confidenceValue': e.value,         // keep if needed
        };
      }).toList();

      return {
        'success': true,
        'prediction': top3[0]['class'],       // ✅ correct key
        'confidence': top3[0]['confidence'],  // ✅ double
        'top3': top3,
};
    } catch (e) {
      print('Prediction error: $e');
      return {'error': 'Prediction failed: $e'};
    }
  }

  // Dispose interpreter
  static void dispose() {
    _interpreter?.close();
  }
}
