import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tomato_disease_app/models/disease_info.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late String _prediction;
  late double _confidence;
  late List<dynamic> _top3;
  late String _imagePath;
  late String _language;
  DiseaseInfo? _diseaseInfo;

  final Map<String, Map<String, String>> _labels = {
    'result': {
      'en': 'Detection Result',
      'hi': 'पहचान परिणाम',
      'mr': 'शोध निकाल',
    },
    'confidence': {
      'en': 'Confidence',
      'hi': 'विश्वास',
      'mr': 'विश्वास',
    },
    'other_possibilities': {
      'en': 'Other Possibilities',
      'hi': 'अन्य संभावनाएं',
      'mr': 'इतर शक्यता',
    },
    'symptoms': {
      'en': 'Symptoms',
      'hi': 'लक्षण',
      'mr': 'लक्षणे',
    },
    'treatment': {
      'en': 'Treatment',
      'hi': 'उपचार',
      'mr': 'उपचार',
    },
    'fertilizer': {
      'en': 'Fertilizer Advice',
      'hi': 'खाद सलाह',
      'mr': 'खत सल्ला',
    },
    'prevention': {
      'en': 'Prevention',
      'hi': 'रोकथाम',
      'mr': 'प्रतिबंध',
    },
    'scan_again': {
      'en': 'Scan Another Plant',
      'hi': 'दूसरा पौधा स्कैन करें',
      'mr': 'दुसरे झाड स्कॅन करा',
    },
    'severity': {
      'en': 'Severity',
      'hi': 'गंभीरता',
      'mr': 'तीव्रता',
    },
  };

  String _t(String key) =>
      _labels[key]?[_language] ?? _labels[key]?['en'] ?? key;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    _prediction = args['prediction'];
    _confidence = (args['confidence'] as num).toDouble();
    _top3 = args['top3'];
    _imagePath = args['imagePath'];
    _language = args['language'] ?? 'en';
    _diseaseInfo = diseaseDatabase[_prediction];
  }

  Color _getSeverityColor(String severity) {
    switch (severity) {
      case 'High':
        return Colors.red;
      case 'Medium':
        return Colors.orange;
      case 'None':
        return Colors.green;
      default:
        return Colors.orange;
    }
  }

  String _getSeverityText(String severity) {
    if (_language == 'hi') {
      switch (severity) {
        case 'High':
          return 'उच्च';
        case 'Medium':
          return 'मध्यम';
        case 'None':
          return 'कोई नहीं';
        default:
          return severity;
      }
    } else if (_language == 'mr') {
      switch (severity) {
        case 'High':
          return 'उच्च';
        case 'Medium':
          return 'मध्यम';
        case 'None':
          return 'काहीही नाही';
        default:
          return severity;
      }
    }
    return severity;
  }

  @override
  Widget build(BuildContext context) {
    final isHealthy = _prediction.contains('healthy');

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B5E20),
        foregroundColor: Colors.white,
        title: Text(_t('result')),
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, '/home'),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.file(
                File(_imagePath),
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 16),

            // Disease name card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isHealthy ? Colors.green[50] : Colors.red[50],
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isHealthy ? Colors.green[300]! : Colors.red[300]!,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        isHealthy ? '✅' : '⚠️',
                        style: const TextStyle(fontSize: 24),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          _diseaseInfo?.name ?? _prediction,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: isHealthy
                                ? Colors.green[800]
                                : Colors.red[800],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Confidence bar
                  Text(
                    '${_t('confidence')}: ${_confidence.toStringAsFixed(1)}%',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 6),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: _confidence / 100,
                      backgroundColor: Colors.grey[200],
                      color: isHealthy ? Colors.green : Colors.red,
                      minHeight: 10,
                    ),
                  ),

                  // 🔥 ADD THIS BLOCK HERE
                  if (_confidence < 60) ...[
                    const SizedBox(height: 10),
                    Text(
                    "⚠️ Low confidence. Please retake a clearer image.",
                    style: TextStyle(
                    color: Colors.orange[800],
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],

                  const SizedBox(height: 12),

                  // Severity badge
                  if (_diseaseInfo != null)
                    Row(
                      children: [
                        Text(
                          '${_t('severity')}: ',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 3),
                          decoration: BoxDecoration(
                            color: _getSeverityColor(_diseaseInfo!.severity)
                                .withOpacity(0.15),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color:
                                  _getSeverityColor(_diseaseInfo!.severity),
                            ),
                          ),
                          child: Text(
                            _getSeverityText(_diseaseInfo!.severity),
                            style: TextStyle(
                              color:
                                  _getSeverityColor(_diseaseInfo!.severity),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Description
            if (_diseaseInfo != null)
              _buildInfoCard(
                icon: Icons.info_outline,
                color: Colors.blue,
                title: _diseaseInfo!.name,
                content:
                    _diseaseInfo!.description[_language] ?? '',
              ),

            // Other possibilities
            if (_top3.length > 1) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey[200]!),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _t('other_possibilities'),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Color(0xFF333333),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ..._top3.skip(1).map((item) {
                      final conf = (item['confidence'] as num).toDouble().toStringAsFixed(1);
                      final cls = item['class'] as String;
                      final info = diseaseDatabase[cls];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                info?.name ?? cls,
                                style: const TextStyle(fontSize: 13),
                              ),
                            ),
                            Text(
                              '$conf%',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],

            const SizedBox(height: 12),

            // Symptoms
            if (_diseaseInfo != null)
              _buildInfoCard(
                icon: Icons.sick_outlined,
                color: Colors.orange,
                title: _t('symptoms'),
                content: _diseaseInfo!.symptoms[_language] ?? '',
              ),

            const SizedBox(height: 12),

            // Treatment
            if (_diseaseInfo != null)
              _buildInfoCard(
                icon: Icons.medical_services_outlined,
                color: Colors.red,
                title: _t('treatment'),
                content: _diseaseInfo!.treatment[_language] ?? '',
              ),

            const SizedBox(height: 12),

            // Fertilizer
            if (_diseaseInfo != null)
              _buildInfoCard(
                icon: Icons.grass,
                color: Colors.green,
                title: _t('fertilizer'),
                content: _diseaseInfo!.fertilizer[_language] ?? '',
              ),

            const SizedBox(height: 12),

            // Prevention
            if (_diseaseInfo != null)
              _buildInfoCard(
                icon: Icons.shield_outlined,
                color: Colors.purple,
                title: _t('prevention'),
                content: _diseaseInfo!.prevention[_language] ?? '',
              ),

            const SizedBox(height: 24),

            // 🔥 AI Disclaimer
Container(
  width: double.infinity,
  padding: const EdgeInsets.all(12),
  decoration: BoxDecoration(
    color: Colors.yellow[50],
    borderRadius: BorderRadius.circular(10),
    border: Border.all(color: Colors.yellow[300]!),
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
      Text(
        "⚠️ Disclaimer",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
      SizedBox(height: 6),
      Text(
        "This prediction is based on AI and may not be 100% accurate.\nFor critical cases, consult an agricultural expert.",
        style: TextStyle(fontSize: 12),
      ),
    ],
  ),
),

const SizedBox(height: 20),

            // Scan again button
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/home'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1B5E20),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.camera_alt),
                label: Text(
                  _t('scan_again'),
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required Color color,
    required String title,
    required String content,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: 18),
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Color(0xFF333333),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            content,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF555555),
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
