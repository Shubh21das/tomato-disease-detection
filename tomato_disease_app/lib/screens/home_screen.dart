import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tomato_disease_app/services/auth_service.dart';
import 'dart:io';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic>? _user;
  String _selectedLanguage = 'en';
  final ImagePicker _picker = ImagePicker();

  final Map<String, String> _languageNames = {
    'en': 'English',
    'hi': 'हिंदी',
    'mr': 'मराठी',
  };

  final Map<String, Map<String, String>> _translations = {
    'welcome': {
      'en': 'Welcome',
      'hi': 'स्वागत है',
      'mr': 'स्वागत आहे',
    },
    'scan_plant': {
      'en': 'Scan Your Plant',
      'hi': 'अपना पौधा स्कैन करें',
      'mr': 'तुमचे झाड स्कॅन करा',
    },
    'take_photo': {
      'en': 'Take Photo',
      'hi': 'फोटो लें',
      'mr': 'फोटो घ्या',
    },
    'choose_gallery': {
      'en': 'Choose from Gallery',
      'hi': 'गैलरी से चुनें',
      'mr': 'गॅलरीतून निवडा',
    },
    'how_to_use': {
      'en': 'How to use',
      'hi': 'कैसे उपयोग करें',
      'mr': 'कसे वापरावे',
    },
    'step1': {
      'en': 'Take a clear photo of the affected tomato leaf',
      'hi': 'प्रभावित टमाटर की पत्ती की स्पष्ट फोटो लें',
      'mr': 'प्रभावित टोमॅटोच्या पानाचा स्पष्ट फोटो घ्या',
    },
    'step2': {
      'en': 'Make sure the leaf fills most of the frame',
      'hi': 'सुनिश्चित करें कि पत्ती फ्रेम का अधिकांश हिस्सा भरे',
      'mr': 'पान फ्रेमचा बहुतांश भाग भरत असल्याची खात्री करा',
    },
    'step3': {
      'en': 'Get instant disease detection and advice',
      'hi': 'तत्काल रोग पहचान और सलाह प्राप्त करें',
      'mr': 'त्वरित रोग ओळख आणि सल्ला मिळवा',
    },
    'logout': {
      'en': 'Logout',
      'hi': 'लॉगआउट',
      'mr': 'लॉगआउट',
    },
  };

  String _t(String key) {
    return _translations[key]?[_selectedLanguage] ??
        _translations[key]?['en'] ??
        key;
  }

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    final user = await AuthService.getCurrentUser();
    setState(() => _user = user);
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        imageQuality: 85,
        maxWidth: 1024,
        maxHeight: 1024,
      );

      if (pickedFile == null) return;
      if (!mounted) return;

      Navigator.pushNamed(
        context,
        '/predict',
        arguments: {
          'imagePath': pickedFile.path,
          'language': _selectedLanguage,
        },
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error picking image: $e')),
      );
    }
  }

  Future<void> _logout() async {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Logout'),
        content: Text(_t('logout') + '?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              await AuthService.logout();
              if (!mounted) return;
              Navigator.pushReplacementNamed(context, '/login');
            },
            child: const Text('Logout',
                style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B5E20),
        foregroundColor: Colors.white,
        title: const Text(
          'Tomato Doctor',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          // Language selector
          PopupMenuButton<String>(
            icon: const Icon(Icons.language, color: Colors.white),
            onSelected: (lang) => setState(() => _selectedLanguage = lang),
            itemBuilder: (ctx) => _languageNames.entries
                .map((e) => PopupMenuItem(
                      value: e.key,
                      child: Row(
                        children: [
                          if (_selectedLanguage == e.key)
                            const Icon(Icons.check,
                                color: Color(0xFF1B5E20), size: 16),
                          if (_selectedLanguage != e.key)
                            const SizedBox(width: 16),
                          const SizedBox(width: 8),
                          Text(e.value),
                        ],
                      ),
                    ))
                .toList(),
          ),
          // Logout
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: _logout,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1B5E20), Color(0xFF388E3C)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${_t('welcome')},',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _user?['name'] ?? 'Farmer',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _user?['village'] ?? '',
                          style: const TextStyle(
                            color: Colors.white60,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text('👨‍🌾', style: TextStyle(fontSize: 48)),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // Scan section title
            Text(
              _t('scan_plant'),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1B5E20),
              ),
            ),

            const SizedBox(height: 16),

            // Camera button
            _buildScanButton(
              icon: Icons.camera_alt,
              label: _t('take_photo'),
              subtitle: _selectedLanguage == 'en'
                  ? 'Use your camera'
                  : _selectedLanguage == 'hi'
                      ? 'अपना कैमरा उपयोग करें'
                      : 'तुमचा कॅमेरा वापरा',
              onTap: () => _pickImage(ImageSource.camera),
              color: const Color(0xFF1B5E20),
            ),

            const SizedBox(height: 12),

            // Gallery button
            _buildScanButton(
              icon: Icons.photo_library,
              label: _t('choose_gallery'),
              subtitle: _selectedLanguage == 'en'
                  ? 'Pick from saved photos'
                  : _selectedLanguage == 'hi'
                      ? 'सहेजी गई फ़ोटो से चुनें'
                      : 'जतन केलेल्या फोटोंमधून निवडा',
              onTap: () => _pickImage(ImageSource.gallery),
              color: const Color(0xFF2E7D32),
            ),

            const SizedBox(height: 28),

            // How to use section
            Text(
              _t('how_to_use'),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1B5E20),
              ),
            ),

            const SizedBox(height: 12),

            _buildStep('1', _t('step1'), Icons.camera_alt),
            _buildStep('2', _t('step2'), Icons.crop_free),
            _buildStep('3', _t('step3'), Icons.science),

            const SizedBox(height: 20),

            // Supported diseases
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.green[200]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.info_outline,
                          color: Colors.green[700], size: 18),
                      const SizedBox(width: 8),
                      Text(
                        _selectedLanguage == 'en'
                            ? 'Can detect 10 diseases'
                            : _selectedLanguage == 'hi'
                                ? '10 बीमारियां पहचान सकता है'
                                : '10 रोग ओळखू शकतो',
                        style: TextStyle(
                          color: Colors.green[700],
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: [
                      'Bacterial Spot',
                      'Early Blight',
                      'Late Blight',
                      'Leaf Mold',
                      'Septoria Spot',
                      'Spider Mites',
                      'Target Spot',
                      'Yellow Curl Virus',
                      'Mosaic Virus',
                      'Healthy',
                    ]
                        .map((d) => Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.green[300]!),
                              ),
                              child: Text(
                                d,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.green[800],
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildScanButton({
    required IconData icon,
    required String label,
    required String subtitle,
    required VoidCallback onTap,
    required Color color,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: Colors.white, size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios,
                color: Colors.white70, size: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildStep(String number, String text, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: const Color(0xFF1B5E20),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                number,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 13, color: Color(0xFF444444)),
            ),
          ),
        ],
      ),
    );
  }
}
