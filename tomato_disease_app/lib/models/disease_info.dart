class DiseaseInfo {
  final String name;
  final Map<String, String> description;
  final Map<String, String> symptoms;
  final Map<String, String> treatment;
  final Map<String, String> fertilizer;
  final Map<String, String> prevention;
  final String severity;

  DiseaseInfo({
    required this.name,
    required this.description,
    required this.symptoms,
    required this.treatment,
    required this.fertilizer,
    required this.prevention,
    required this.severity,
  });
}

final Map<String, DiseaseInfo> diseaseDatabase = {
  "Tomato___Bacterial_spot": DiseaseInfo(
    name: "Bacterial Spot",
    severity: "Medium",
    description: {
      "en": "Bacterial spot is caused by Xanthomonas bacteria. It affects leaves, stems and fruits.",
      "hi": "बैक्टीरियल स्पॉट जैंथोमोनास बैक्टीरिया के कारण होता है। यह पत्तियों, तनों और फलों को प्रभावित करता है।",
      "mr": "बॅक्टेरियल स्पॉट झॅन्थोमोनास जीवाणूमुळे होतो. हे पाने, देठ आणि फळांवर परिणाम करते.",
    },
    symptoms: {
      "en": "Small dark brown spots on leaves, water-soaked lesions, yellowing around spots, fruit with raised scabby spots.",
      "hi": "पत्तियों पर छोटे गहरे भूरे धब्बे, पानी से भीगे घाव, धब्बों के आसपास पीलापन, फल पर उभरे हुए धब्बे।",
      "mr": "पानांवर लहान गडद तपकिरी डाग, पाण्याने भिजलेले जखम, डागांभोवती पिवळसरपणा, फळांवर उठलेले डाग।",
    },
    treatment: {
      "en": "Spray copper-based bactericide every 7-10 days. Remove and destroy infected plant parts immediately.",
      "hi": "हर 7-10 दिन में कॉपर-आधारित बैक्टीरीसाइड स्प्रे करें। संक्रमित पौधे के हिस्सों को तुरंत हटाएं और नष्ट करें।",
      "mr": "दर 7-10 दिवसांनी कॉपर-आधारित बॅक्टेरिसाइड फवारणी करा. संक्रमित वनस्पतींचे भाग ताबडतोब काढून टाका.",
    },
    fertilizer: {
      "en": "Use potassium-rich fertilizer (NPK 12-12-17). Avoid excess nitrogen which increases susceptibility.",
      "hi": "पोटेशियम युक्त खाद (NPK 12-12-17) का उपयोग करें। अधिक नाइट्रोजन से बचें जो संवेदनशीलता बढ़ाता है।",
      "mr": "पोटॅशियम समृद्ध खत (NPK 12-12-17) वापरा. जास्त नायट्रोजन टाळा जे संवेदनशीलता वाढवते.",
    },
    prevention: {
      "en": "Use disease-free seeds, avoid overhead irrigation, rotate crops every season, maintain plant spacing.",
      "hi": "रोग मुक्त बीज का उपयोग करें, ऊपर से सिंचाई से बचें, हर मौसम में फसल बदलें, पौधों के बीच दूरी बनाए रखें।",
      "mr": "रोगमुक्त बियाणे वापरा, वरून सिंचन टाळा, प्रत्येक हंगामात पीक बदला, झाडांमधील अंतर राखा.",
    },
  ),

  "Tomato___Early_blight": DiseaseInfo(
    name: "Early Blight",
    severity: "Medium",
    description: {
      "en": "Early blight is caused by Alternaria solani fungus. It is one of the most common tomato diseases.",
      "hi": "अर्ली ब्लाइट अल्टरनेरिया सोलानी कवक के कारण होता है। यह टमाटर की सबसे आम बीमारियों में से एक है।",
      "mr": "अर्ली ब्लाइट अल्टरनेरिया सोलानी बुरशीमुळे होतो. हा टोमॅटोच्या सर्वात सामान्य रोगांपैकी एक आहे.",
    },
    symptoms: {
      "en": "Dark brown spots with concentric rings (target-like pattern) on older leaves, yellowing, premature leaf drop.",
      "hi": "पुरानी पत्तियों पर गहरे भूरे धब्बे जो निशाने जैसे दिखते हैं, पीलापन, समय से पहले पत्ती गिरना।",
      "mr": "जुन्या पानांवर गडद तपकिरी डाग जे लक्ष्यासारखे दिसतात, पिवळसरपणा, अकाली पाने गळणे.",
    },
    treatment: {
      "en": "Apply Mancozeb or Chlorothalonil fungicide. Spray every 7 days during wet weather.",
      "hi": "मैनकोज़ेब या क्लोरोथेलोनिल कवकनाशी लगाएं। गीले मौसम में हर 7 दिन में स्प्रे करें।",
      "mr": "मॅन्कोझेब किंवा क्लोरोथेलोनिल बुरशीनाशक लावा. ओल्या हवामानात दर 7 दिवसांनी फवारणी करा.",
    },
    fertilizer: {
      "en": "Apply balanced NPK 19-19-19 fertilizer. Add calcium and magnesium supplements to strengthen plant immunity.",
      "hi": "संतुलित NPK 19-19-19 खाद लगाएं। पौधे की रोग प्रतिरोधक क्षमता मजबूत करने के लिए कैल्शियम और मैग्नीशियम मिलाएं।",
      "mr": "संतुलित NPK 19-19-19 खत द्या. झाडाची रोगप्रतिकारक शक्ती वाढवण्यासाठी कॅल्शियम आणि मॅग्नेशियम घाला.",
    },
    prevention: {
      "en": "Remove lower infected leaves, avoid wetting foliage, use mulch to prevent soil splash, crop rotation.",
      "hi": "निचली संक्रमित पत्तियों को हटाएं, पत्तियों को गीला होने से बचाएं, मिट्टी के छींटे रोकने के लिए मल्च का उपयोग करें।",
      "mr": "खालची संक्रमित पाने काढा, पाने ओली होऊ देऊ नका, माती उडण्यापासून रोखण्यासाठी मल्च वापरा.",
    },
  ),

  "Tomato___Late_blight": DiseaseInfo(
    name: "Late Blight",
    severity: "High",
    description: {
      "en": "Late blight caused by Phytophthora infestans is a very destructive disease that can destroy entire crops within days.",
      "hi": "फाइटोफ्थोरा इन्फेस्टान्स के कारण होने वाला लेट ब्लाइट एक बहुत विनाशकारी रोग है जो कुछ ही दिनों में पूरी फसल को नष्ट कर सकता है।",
      "mr": "फायटोफ्थोरा इन्फेस्टान्समुळे होणारा लेट ब्लाइट हा अत्यंत विनाशकारी रोग आहे जो काही दिवसांत संपूर्ण पीक नष्ट करू शकतो.",
    },
    symptoms: {
      "en": "Large irregular dark brown/black lesions on leaves and stems, white mold on leaf undersides, fruit turns brown and rots.",
      "hi": "पत्तियों और तनों पर बड़े अनियमित गहरे भूरे/काले घाव, पत्तियों के नीचे सफेद फफूंद, फल भूरे होकर सड़ जाते हैं।",
      "mr": "पाने आणि देठांवर मोठे अनियमित गडद तपकिरी/काळे जखम, पानांच्या खालच्या बाजूला पांढरी बुरशी, फळे तपकिरी होऊन कुजतात.",
    },
    treatment: {
      "en": "Immediately apply Metalaxyl + Mancozeb fungicide. Remove and burn all infected plants. Act within 24 hours.",
      "hi": "तुरंत मेटालैक्सिल + मैनकोज़ेब कवकनाशी लगाएं। सभी संक्रमित पौधों को हटाकर जला दें। 24 घंटे के भीतर कार्य करें।",
      "mr": "ताबडतोब मेटालॅक्सिल + मॅन्कोझेब बुरशीनाशक लावा. सर्व संक्रमित झाडे काढून जाळा. 24 तासांत कार्य करा.",
    },
    fertilizer: {
      "en": "Use phosphorus and potassium rich fertilizer (NPK 10-20-20). Avoid high nitrogen fertilizers completely.",
      "hi": "फास्फोरस और पोटेशियम युक्त खाद (NPK 10-20-20) का उपयोग करें। उच्च नाइट्रोजन खाद से पूरी तरह बचें।",
      "mr": "फॉस्फरस आणि पोटॅशियम समृद्ध खत (NPK 10-20-20) वापरा. उच्च नायट्रोजन खत पूर्णपणे टाळा.",
    },
    prevention: {
      "en": "Plant resistant varieties, ensure good air circulation, avoid overhead watering, monitor weather forecasts for humid conditions.",
      "hi": "प्रतिरोधी किस्में लगाएं, अच्छा वायु संचार सुनिश्चित करें, ऊपर से पानी देने से बचें, आर्द्र परिस्थितियों के लिए मौसम पूर्वानुमान देखें।",
      "mr": "प्रतिरोधक जाती लावा, चांगले हवा परिसंचरण सुनिश्चित करा, वरून पाणी देणे टाळा, दमट परिस्थितीसाठी हवामान अंदाज पहा.",
    },
  ),

  "Tomato___Leaf_Mold": DiseaseInfo(
    name: "Leaf Mold",
    severity: "Medium",
    description: {
      "en": "Leaf mold is caused by Passalora fulva fungus. It thrives in high humidity conditions especially in greenhouses.",
      "hi": "लीफ मोल्ड पासालोरा फुल्वा कवक के कारण होता है। यह उच्च आर्द्रता में पनपता है विशेष रूप से ग्रीनहाउस में।",
      "mr": "लीफ मोल्ड पासालोरा फुल्वा बुरशीमुळे होतो. हे उच्च आर्द्रतेमध्ये विशेषतः हरितगृहात वाढते.",
    },
    symptoms: {
      "en": "Yellow patches on upper leaf surface, olive-green to brown velvety mold on leaf undersides, leaves curl and wither.",
      "hi": "पत्ती की ऊपरी सतह पर पीले धब्बे, पत्तियों के नीचे जैतून-हरे से भूरे रंग का मखमली फफूंद, पत्तियां मुड़ती और सूखती हैं।",
      "mr": "पानांच्या वरच्या पृष्ठभागावर पिवळे ठिपके, पानांच्या खालच्या बाजूला ऑलिव्ह-हिरव्या ते तपकिरी मखमली बुरशी.",
    },
    treatment: {
      "en": "Apply Chlorothalonil or Copper fungicide. Improve ventilation. Reduce humidity below 85%.",
      "hi": "क्लोरोथेलोनिल या कॉपर कवकनाशी लगाएं। वेंटिलेशन सुधारें। आर्द्रता 85% से नीचे रखें।",
      "mr": "क्लोरोथेलोनिल किंवा कॉपर बुरशीनाशक लावा. वायुवीजन सुधारा. आर्द्रता 85% खाली ठेवा.",
    },
    fertilizer: {
      "en": "Use calcium nitrate fertilizer to strengthen cell walls. Apply NPK 15-15-15 for balanced nutrition.",
      "hi": "कोशिका दीवारों को मजबूत करने के लिए कैल्शियम नाइट्रेट खाद का उपयोग करें। संतुलित पोषण के लिए NPK 15-15-15 लगाएं।",
      "mr": "पेशींच्या भिंती मजबूत करण्यासाठी कॅल्शियम नायट्रेट खत वापरा. संतुलित पोषणासाठी NPK 15-15-15 द्या.",
    },
    prevention: {
      "en": "Maintain proper plant spacing, prune lower leaves for air circulation, avoid wetting leaves during watering.",
      "hi": "उचित पौधों की दूरी बनाए रखें, वायु संचार के लिए निचली पत्तियों को काटें, पानी देते समय पत्तियां गीली न करें।",
      "mr": "योग्य झाडांचे अंतर राखा, हवा परिसंचरणासाठी खालची पाने छाटा, पाणी देताना पाने ओली करू नका.",
    },
  ),

  "Tomato___Septoria_leaf_spot": DiseaseInfo(
    name: "Septoria Leaf Spot",
    severity: "Medium",
    description: {
      "en": "Septoria leaf spot is caused by Septoria lycopersici fungus. It spreads rapidly in warm wet weather.",
      "hi": "सेप्टोरिया लीफ स्पॉट सेप्टोरिया लाइकोपर्सिकी कवक के कारण होता है। यह गर्म गीले मौसम में तेजी से फैलता है।",
      "mr": "सेप्टोरिया लीफ स्पॉट सेप्टोरिया लायकोपर्सिकी बुरशीमुळे होतो. हे उष्ण ओल्या हवामानात वेगाने पसरते.",
    },
    symptoms: {
      "en": "Small circular spots with dark borders and light gray centers on leaves, tiny black dots visible in center of spots.",
      "hi": "पत्तियों पर गहरे किनारों और हल्के भूरे केंद्र वाले छोटे गोल धब्बे, धब्बों के केंद्र में छोटे काले बिंदु।",
      "mr": "पानांवर गडद कडा आणि हलक्या राखाडी मध्यभागासह लहान गोल डाग, डागांच्या मध्यभागी लहान काळे ठिपके.",
    },
    treatment: {
      "en": "Spray Mancozeb, Chlorothalonil or Copper fungicide every 10 days. Remove infected leaves immediately.",
      "hi": "हर 10 दिन में मैनकोज़ेब, क्लोरोथेलोनिल या कॉपर कवकनाशी स्प्रे करें। संक्रमित पत्तियों को तुरंत हटाएं।",
      "mr": "दर 10 दिवसांनी मॅन्कोझेब, क्लोरोथेलोनिल किंवा कॉपर बुरशीनाशक फवारा. संक्रमित पाने ताबडतोब काढा.",
    },
    fertilizer: {
      "en": "Apply potassium and phosphorus rich fertilizer. Use NPK 13-0-44 to boost plant immunity.",
      "hi": "पोटेशियम और फास्फोरस युक्त खाद लगाएं। पौधे की रोग प्रतिरोधक क्षमता बढ़ाने के लिए NPK 13-0-44 का उपयोग करें।",
      "mr": "पोटॅशियम आणि फॉस्फरस समृद्ध खत द्या. झाडाची रोगप्रतिकारक शक्ती वाढवण्यासाठी NPK 13-0-44 वापरा.",
    },
    prevention: {
      "en": "Avoid overhead irrigation, use drip irrigation, remove plant debris after harvest, use resistant varieties.",
      "hi": "ऊपर से सिंचाई से बचें, ड्रिप सिंचाई का उपयोग करें, फसल के बाद पौधे के अवशेष हटाएं।",
      "mr": "वरून सिंचन टाळा, ठिबक सिंचन वापरा, कापणीनंतर वनस्पतींचे अवशेष काढा.",
    },
  ),

  "Tomato___Spider_mites Two-spotted_spider_mite": DiseaseInfo(
    name: "Spider Mites",
    severity: "Medium",
    description: {
      "en": "Spider mites are tiny pests that suck plant juices. They thrive in hot dry conditions and multiply rapidly.",
      "hi": "मकड़ी के कण छोटे कीट हैं जो पौधे का रस चूसते हैं। वे गर्म सूखी परिस्थितियों में पनपते हैं।",
      "mr": "स्पायडर माइट्स लहान कीटक आहेत जे वनस्पतींचा रस शोषतात. ते उष्ण कोरड्या परिस्थितीत वाढतात.",
    },
    symptoms: {
      "en": "Tiny yellow or white speckles on leaves, fine webbing on plant, leaves turn bronze and drop, stunted growth.",
      "hi": "पत्तियों पर छोटे पीले या सफेद धब्बे, पौधे पर बारीक जाल, पत्तियां कांस्य रंग की होकर गिरती हैं।",
      "mr": "पानांवर लहान पिवळे किंवा पांढरे ठिपके, झाडावर बारीक जाळे, पाने कांस्यरंगी होऊन गळतात.",
    },
    treatment: {
      "en": "Spray Abamectin or Spiromesifen miticide. Use neem oil spray as organic alternative. Spray under leaves.",
      "hi": "एबामेक्टिन या स्पाइरोमेसिफेन माइटीसाइड स्प्रे करें। जैविक विकल्प के रूप में नीम तेल स्प्रे का उपयोग करें।",
      "mr": "अबामेक्टिन किंवा स्पायरोमेसिफेन माइटिसाइड फवारा. सेंद्रिय पर्याय म्हणून कडुनिंबाचे तेल फवारा.",
    },
    fertilizer: {
      "en": "Use silicon-based foliar spray to strengthen leaves. Apply balanced NPK 20-20-20 to maintain plant vigor.",
      "hi": "पत्तियों को मजबूत करने के लिए सिलिकॉन आधारित फोलियर स्प्रे का उपयोग करें। NPK 20-20-20 लगाएं।",
      "mr": "पाने मजबूत करण्यासाठी सिलिकॉन-आधारित फोलियर स्प्रे वापरा. NPK 20-20-20 द्या.",
    },
    prevention: {
      "en": "Keep plants well watered, introduce predatory mites, remove heavily infested leaves, avoid dusty conditions.",
      "hi": "पौधों को अच्छी तरह पानी दें, शिकारी कण पेश करें, भारी संक्रमित पत्तियों को हटाएं।",
      "mr": "झाडांना चांगले पाणी द्या, भक्षक माइट्स सोडा, जास्त संक्रमित पाने काढा.",
    },
  ),

  "Tomato___Target_Spot": DiseaseInfo(
    name: "Target Spot",
    severity: "Medium",
    description: {
      "en": "Target spot is caused by Corynespora cassiicola fungus. It affects all above-ground parts of the tomato plant.",
      "hi": "टार्गेट स्पॉट कोरिनेस्पोरा कैसीकोला कवक के कारण होता है। यह टमाटर के पौधे के सभी ऊपरी भागों को प्रभावित करता है।",
      "mr": "टार्गेट स्पॉट कोरायनेस्पोरा कॅसिकोला बुरशीमुळे होतो. हे टोमॅटो झाडाच्या सर्व वरच्या भागांवर परिणाम करते.",
    },
    symptoms: {
      "en": "Brown spots with concentric rings and yellow halo on leaves, dark sunken spots on fruit, defoliation in severe cases.",
      "hi": "पत्तियों पर संकेंद्रित छल्लों और पीले प्रभामंडल के साथ भूरे धब्बे, फल पर गहरे धंसे हुए धब्बे।",
      "mr": "पानांवर एककेंद्री वलये आणि पिवळ्या प्रभामंडलासह तपकिरी डाग, फळांवर गडद बुडलेले डाग.",
    },
    treatment: {
      "en": "Apply Azoxystrobin or Boscalid fungicide. Spray every 14 days. Remove infected leaves and fruits.",
      "hi": "एजोक्सीस्ट्रोबिन या बोस्कालिड कवकनाशी लगाएं। हर 14 दिन में स्प्रे करें। संक्रमित पत्तियां और फल हटाएं।",
      "mr": "अॅझोक्सीस्ट्रोबिन किंवा बोस्कालिड बुरशीनाशक लावा. दर 14 दिवसांनी फवारणी करा.",
    },
    fertilizer: {
      "en": "Apply NPK 17-17-17 with micronutrients. Add zinc and boron supplements for better disease resistance.",
      "hi": "सूक्ष्म पोषक तत्वों के साथ NPK 17-17-17 लगाएं। बेहतर रोग प्रतिरोधक क्षमता के लिए जिंक और बोरॉन मिलाएं।",
      "mr": "सूक्ष्म पोषक तत्वांसह NPK 17-17-17 द्या. चांगल्या रोगप्रतिकारक शक्तीसाठी झिंक आणि बोरॉन घाला.",
    },
    prevention: {
      "en": "Improve air circulation, avoid leaf wetness, use drip irrigation, practice crop rotation, use certified seeds.",
      "hi": "वायु संचार सुधारें, पत्तियों को गीला होने से बचाएं, ड्रिप सिंचाई का उपयोग करें, फसल चक्र अपनाएं।",
      "mr": "हवा परिसंचरण सुधारा, पाने ओली होऊ देऊ नका, ठिबक सिंचन वापरा, पीक फेरपालट करा.",
    },
  ),

  "Tomato___Tomato_Yellow_Leaf_Curl_Virus": DiseaseInfo(
    name: "Yellow Leaf Curl Virus",
    severity: "High",
    description: {
      "en": "Yellow Leaf Curl Virus (TYLCV) is spread by whiteflies. It is one of the most damaging tomato viruses worldwide.",
      "hi": "यलो लीफ कर्ल वायरस सफेद मक्खियों द्वारा फैलता है। यह दुनिया भर में टमाटर के सबसे हानिकारक वायरस में से एक है।",
      "mr": "यलो लीफ कर्ल व्हायरस पांढऱ्या माशीद्वारे पसरतो. हा जगभरातील टोमॅटोच्या सर्वात हानिकारक विषाणूंपैकी एक आहे.",
    },
    symptoms: {
      "en": "Leaves curl upward and turn yellow, stunted plant growth, reduced fruit production, flowers may drop.",
      "hi": "पत्तियां ऊपर की ओर मुड़ती और पीली होती हैं, पौधे की वृद्धि रुक जाती है, फल उत्पादन कम होता है।",
      "mr": "पाने वर वळतात आणि पिवळी होतात, झाडाची वाढ खुंटते, फळ उत्पादन कमी होते, फुले गळू शकतात.",
    },
    treatment: {
      "en": "No cure exists. Remove and destroy infected plants immediately. Control whitefly population with Imidacloprid spray.",
      "hi": "कोई इलाज नहीं है। संक्रमित पौधों को तुरंत हटाएं और नष्ट करें। इमिडाक्लोप्रिड स्प्रे से सफेद मक्खी नियंत्रित करें।",
      "mr": "कोणताही इलाज नाही. संक्रमित झाडे ताबडतोब काढून नष्ट करा. इमिडाक्लोप्रिड फवारणीने पांढरी माशी नियंत्रित करा.",
    },
    fertilizer: {
      "en": "Focus on prevention. Use NPK 12-32-16 to strengthen uninfected plants. Avoid excess nitrogen.",
      "hi": "रोकथाम पर ध्यान दें। असंक्रमित पौधों को मजबूत करने के लिए NPK 12-32-16 का उपयोग करें।",
      "mr": "प्रतिबंधावर लक्ष केंद्रित करा. असंक्रमित झाडे मजबूत करण्यासाठी NPK 12-32-16 वापरा.",
    },
    prevention: {
      "en": "Use virus-resistant varieties, install yellow sticky traps for whiteflies, use reflective mulch, plant barrier crops.",
      "hi": "वायरस प्रतिरोधी किस्में लगाएं, सफेद मक्खियों के लिए पीले चिपचिपे जाल लगाएं, परावर्तक मल्च का उपयोग करें।",
      "mr": "विषाणू-प्रतिरोधक जाती लावा, पांढऱ्या माशीसाठी पिवळे चिकट सापळे लावा, परावर्तक मल्च वापरा.",
    },
  ),

  "Tomato___Tomato_mosaic_virus": DiseaseInfo(
    name: "Tomato Mosaic Virus",
    severity: "High",
    description: {
      "en": "Tomato Mosaic Virus (ToMV) spreads through infected tools, hands and seeds. It reduces yield significantly.",
      "hi": "टोमेटो मोज़ेक वायरस संक्रमित औजारों, हाथों और बीजों के माध्यम से फैलता है। यह उपज को काफी कम करता है।",
      "mr": "टोमॅटो मोझॅक व्हायरस संक्रमित साधने, हात आणि बियाण्यांद्वारे पसरतो. यामुळे उत्पादन लक्षणीयरीत्या कमी होते.",
    },
    symptoms: {
      "en": "Mottled light and dark green pattern on leaves, leaf distortion and curling, stunted growth, reduced fruit size.",
      "hi": "पत्तियों पर हल्के और गहरे हरे रंग का मोज़ेक पैटर्न, पत्ती विकृति और मुड़ना, वृद्धि रुकना, फल का आकार कम होना।",
      "mr": "पानांवर हलक्या आणि गडद हिरव्या रंगाचा मोझॅक नमुना, पाने विकृत आणि वळणे, वाढ खुंटणे.",
    },
    treatment: {
      "en": "No chemical cure. Remove infected plants. Disinfect tools with 10% bleach solution. Wash hands thoroughly.",
      "hi": "कोई रासायनिक इलाज नहीं। संक्रमित पौधों को हटाएं। 10% ब्लीच घोल से औजार कीटाणुरहित करें।",
      "mr": "कोणताही रासायनिक इलाज नाही. संक्रमित झाडे काढा. 10% ब्लीच द्रावणाने साधने निर्जंतुक करा.",
    },
    fertilizer: {
      "en": "Use NPK 15-30-15 to boost healthy plant growth. Add micronutrients zinc and manganese for plant strength.",
      "hi": "स्वस्थ पौधे की वृद्धि बढ़ाने के लिए NPK 15-30-15 का उपयोग करें। पौधे की शक्ति के लिए जिंक और मैंगनीज मिलाएं।",
      "mr": "निरोगी झाडाची वाढ वाढवण्यासाठी NPK 15-30-15 वापरा. झाडाच्या शक्तीसाठी झिंक आणि मॅंगनीज घाला.",
    },
    prevention: {
      "en": "Use certified virus-free seeds, disinfect all tools, remove weed hosts, avoid tobacco products near plants.",
      "hi": "प्रमाणित वायरस मुक्त बीज का उपयोग करें, सभी औजार कीटाणुरहित करें, खरपतवार हटाएं, पौधों के पास तंबाकू उत्पाद न लाएं।",
      "mr": "प्रमाणित विषाणूमुक्त बियाणे वापरा, सर्व साधने निर्जंतुक करा, तण काढा, झाडांजवळ तंबाकू उत्पादने आणू नका.",
    },
  ),

  "Tomato___healthy": DiseaseInfo(
    name: "Healthy Plant",
    severity: "None",
    description: {
      "en": "Your tomato plant is healthy! No disease detected. Continue your current care practices.",
      "hi": "आपका टमाटर का पौधा स्वस्थ है! कोई बीमारी नहीं मिली। अपनी वर्तमान देखभाल प्रथाओं को जारी रखें।",
      "mr": "तुमचे टोमॅटो झाड निरोगी आहे! कोणताही रोग आढळला नाही. तुमच्या सध्याच्या काळजीच्या पद्धती सुरू ठेवा.",
    },
    symptoms: {
      "en": "No symptoms. Plant looks green and vigorous with no spots, lesions or discoloration.",
      "hi": "कोई लक्षण नहीं। पौधा हरा और जोरदार दिखता है, कोई धब्बे, घाव या रंग परिवर्तन नहीं।",
      "mr": "कोणतीही लक्षणे नाहीत. झाड हिरवे आणि जोमदार दिसते, कोणतेही डाग, जखम किंवा रंग बदल नाही.",
    },
    treatment: {
      "en": "No treatment needed. Keep monitoring your plant regularly for any early signs of disease.",
      "hi": "कोई उपचार की जरूरत नहीं। बीमारी के किसी भी शुरुआती संकेत के लिए नियमित रूप से अपने पौधे की निगरानी करते रहें।",
      "mr": "कोणत्याही उपचाराची गरज नाही. रोगाच्या कोणत्याही सुरुवातीच्या लक्षणांसाठी नियमितपणे आपल्या झाडाचे निरीक्षण करत राहा.",
    },
    fertilizer: {
      "en": "Continue regular fertilization with NPK 19-19-19. Water consistently and ensure proper sunlight.",
      "hi": "NPK 19-19-19 के साथ नियमित खाद जारी रखें। नियमित रूप से पानी दें और उचित धूप सुनिश्चित करें।",
      "mr": "NPK 19-19-19 सह नियमित खत सुरू ठेवा. सातत्याने पाणी द्या आणि योग्य सूर्यप्रकाश सुनिश्चित करा.",
    },
    prevention: {
      "en": "Maintain regular watering schedule, ensure good drainage, check for pests weekly, use balanced fertilizer monthly.",
      "hi": "नियमित पानी देने का कार्यक्रम बनाए रखें, अच्छी जल निकासी सुनिश्चित करें, साप्ताहिक कीटों की जांच करें।",
      "mr": "नियमित पाणी देण्याचे वेळापत्रक राखा, चांगला निचरा सुनिश्चित करा, साप्ताहिक कीटकांची तपासणी करा.",
    },
  ),
};
