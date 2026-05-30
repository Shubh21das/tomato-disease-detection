# Quick Reference Card - Tomato Disease Detection

## 🚀 Quick Start

### 1. Training the Model
```bash
# Open Jupyter Notebook
jupyter notebook tomato_disease_detection_FIXED.ipynb

# Update dataset path in cell 2
DATASET_PATH = r"C:\YOUR\PATH\TO\Dataset"

# Run all cells (Cell → Run All)
# Wait for training to complete (~30-60 minutes)
```

### 2. Making Predictions
```python
from tensorflow.keras.preprocessing import image
import numpy as np
import tensorflow as tf

# Load model
model = tf.keras.models.load_model("best_tomato_disease_model.keras")

# Load class names
import json
with open("class_names.json", "r") as f:
    class_names = json.load(f)

# Predict
def predict(img_path):
    img = image.load_img(img_path, target_size=(128, 128))
    img_array = image.img_to_array(img)
    img_array = img_array / 255.0  # CRITICAL: Normalize!
    img_array = np.expand_dims(img_array, axis=0)
    
    predictions = model.predict(img_array)[0]
    predicted_idx = np.argmax(predictions)
    
    return {
        'disease': class_names[predicted_idx],
        'confidence': float(predictions[predicted_idx] * 100)
    }

# Use it
result = predict("test_image.jpg")
print(f"Disease: {result['disease']}")
print(f"Confidence: {result['confidence']:.2f}%")
```

---

## 📱 Mobile App Integration

### Android (Kotlin)
```kotlin
// Add TensorFlow Lite dependency
implementation 'org.tensorflow:tensorflow-lite:2.13.0'

// Load model
val model = Interpreter(loadModelFile("tomato_disease_model.tflite"))

// Prepare image
fun preprocessImage(bitmap: Bitmap): ByteBuffer {
    val inputBuffer = ByteBuffer.allocateDirect(1 * 128 * 128 * 3 * 4)
    inputBuffer.order(ByteOrder.nativeOrder())
    
    val scaledBitmap = Bitmap.createScaledBitmap(bitmap, 128, 128, true)
    
    for (y in 0 until 128) {
        for (x in 0 until 128) {
            val pixel = scaledBitmap.getPixel(x, y)
            inputBuffer.putFloat(((pixel shr 16) and 0xFF) / 255.0f)  // R
            inputBuffer.putFloat(((pixel shr 8) and 0xFF) / 255.0f)   // G
            inputBuffer.putFloat((pixel and 0xFF) / 255.0f)           // B
        }
    }
    return inputBuffer
}

// Predict
val outputBuffer = Array(1) { FloatArray(10) }
model.run(inputBuffer, outputBuffer)

val predictions = outputBuffer[0]
val maxIdx = predictions.indices.maxByOrNull { predictions[it] } ?: 0
val confidence = predictions[maxIdx] * 100

println("Disease: ${classNames[maxIdx]}")
println("Confidence: $confidence%")
```

### iOS (Swift)
```swift
import TensorFlowLite

// Load model
guard let modelPath = Bundle.main.path(forResource: "tomato_disease_model", ofType: "tflite") else {
    fatalError("Model not found")
}
let interpreter = try Interpreter(modelPath: modelPath)

// Prepare image
func preprocessImage(_ image: UIImage) -> Data {
    guard let cgImage = image.cgImage else { return Data() }
    
    let size = CGSize(width: 128, height: 128)
    let resizedImage = image.resized(to: size)
    
    var pixelValues = [Float]()
    for y in 0..<128 {
        for x in 0..<128 {
            let pixel = resizedImage.getPixel(x: x, y: y)
            pixelValues.append(Float(pixel.red) / 255.0)
            pixelValues.append(Float(pixel.green) / 255.0)
            pixelValues.append(Float(pixel.blue) / 255.0)
        }
    }
    
    return Data(copyingBufferOf: pixelValues)
}

// Predict
try interpreter.allocateTensors()
try interpreter.copy(inputData, toInputAt: 0)
try interpreter.invoke()

let outputTensor = try interpreter.output(at: 0)
let predictions = [Float](unsafeData: outputTensor.data) ?? []

let maxIdx = predictions.enumerated().max(by: { $0.element < $1.element })?.offset ?? 0
let confidence = predictions[maxIdx] * 100

print("Disease: \(classNames[maxIdx])")
print("Confidence: \(confidence)%")
```

---

## 🌐 Web App Integration

### Flask Backend
```python
from flask import Flask, request, jsonify
from flask_cors import CORS
import tensorflow as tf
import numpy as np
from PIL import Image
import io
import json

app = Flask(__name__)
CORS(app)

# Load model and class names
model = tf.keras.models.load_model("best_tomato_disease_model.keras")
with open("class_names.json", "r") as f:
    class_names = json.load(f)

@app.route('/predict', methods=['POST'])
def predict():
    if 'image' not in request.files:
        return jsonify({'error': 'No image provided'}), 400
    
    # Read image
    img_file = request.files['image']
    img = Image.open(io.BytesIO(img_file.read()))
    
    # Preprocess
    img = img.convert('RGB')
    img = img.resize((128, 128))
    img_array = np.array(img) / 255.0
    img_array = np.expand_dims(img_array, axis=0)
    
    # Predict
    predictions = model.predict(img_array)[0]
    predicted_idx = int(np.argmax(predictions))
    confidence = float(predictions[predicted_idx] * 100)
    
    # Get top 3
    top_3_idx = np.argsort(predictions)[-3:][::-1]
    top_3 = [
        {
            'disease': class_names[idx],
            'confidence': float(predictions[idx] * 100)
        }
        for idx in top_3_idx
    ]
    
    return jsonify({
        'disease': class_names[predicted_idx],
        'confidence': confidence,
        'top_3': top_3
    })

if __name__ == '__main__':
    app.run(debug=True, port=5000)
```

### React Frontend
```javascript
import React, { useState } from 'react';
import axios from 'axios';

function DiseaseDetector() {
  const [selectedImage, setSelectedImage] = useState(null);
  const [prediction, setPrediction] = useState(null);
  const [loading, setLoading] = useState(false);

  const handleImageChange = (e) => {
    setSelectedImage(e.target.files[0]);
  };

  const handlePredict = async () => {
    if (!selectedImage) return;
    
    setLoading(true);
    const formData = new FormData();
    formData.append('image', selectedImage);
    
    try {
      const response = await axios.post('http://localhost:5000/predict', formData);
      setPrediction(response.data);
    } catch (error) {
      console.error('Prediction error:', error);
    }
    setLoading(false);
  };

  return (
    <div>
      <h1>Tomato Disease Detector</h1>
      <input type="file" accept="image/*" onChange={handleImageChange} />
      <button onClick={handlePredict} disabled={!selectedImage || loading}>
        {loading ? 'Analyzing...' : 'Detect Disease'}
      </button>
      
      {prediction && (
        <div>
          <h2>{prediction.disease}</h2>
          <p>Confidence: {prediction.confidence.toFixed(2)}%</p>
          
          <h3>Top 3 Predictions:</h3>
          <ul>
            {prediction.top_3.map((item, idx) => (
              <li key={idx}>
                {item.disease}: {item.confidence.toFixed(2)}%
              </li>
            ))}
          </ul>
        </div>
      )}
    </div>
  );
}

export default DiseaseDetector;
```

---

## 🐛 Common Issues & Solutions

| Issue | Solution |
|-------|----------|
| **Wrong predictions** | Ensure image is normalized (`÷255`) and resized to 128x128 |
| **Low confidence** | Model needs more training or better data |
| **Slow inference** | Use TFLite model, reduce batch size, or quantize |
| **Out of memory** | Reduce image size or batch size |
| **Model not loading** | Check file path and TensorFlow version |
| **High train, low val accuracy** | Model overfitting - add more augmentation/dropout |

---

## 📊 Model Specifications

| Parameter | Value |
|-----------|-------|
| Input Size | 128 × 128 × 3 |
| Output Size | 10 (disease classes) |
| Normalization | [0, 1] (÷255) |
| Architecture | Custom CNN (5 blocks) |
| Parameters | ~2-3 million |
| Format | Keras (.keras), TFLite (.tflite) |

---

## ✅ Pre-Deployment Checklist

- [ ] Test accuracy > 85%
- [ ] All 10 classes predicted correctly
- [ ] Model file < 50 MB
- [ ] Prediction time < 2 seconds
- [ ] Normalized input verified
- [ ] Confidence threshold set (e.g., 80%)
- [ ] Error handling implemented
- [ ] TFLite model tested on mobile
- [ ] API endpoints tested
- [ ] Documentation complete

---

## 🎯 Disease Classes

1. Tomato___Bacterial_spot
2. Tomato___Early_blight
3. Tomato___Late_blight
4. Tomato___Leaf_Mold
5. Tomato___Septoria_leaf_spot
6. Tomato___Spider_mites_Two-spotted_spider_mite
7. Tomato___Target_Spot
8. Tomato___Tomato_Yellow_Leaf_Curl_Virus
9. Tomato___Tomato_mosaic_virus
10. Tomato___healthy

---

## 📞 Support

If you encounter issues:
1. Check normalization (÷255)
2. Verify image size (128×128)
3. Ensure model loaded correctly
4. Check TensorFlow version compatibility
5. Review error logs

**Remember: The #1 cause of wrong predictions is forgetting to normalize images!**
