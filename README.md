# AI-Based Tomato Plant Disease Detection Using CNN

## Project Overview

Tomato crops are highly susceptible to various diseases that can significantly reduce yield and crop quality. Early detection of these diseases helps farmers take timely preventive measures and improve productivity.

This project presents an AI-powered Tomato Plant Disease Detection System using Convolutional Neural Networks (CNN). The model analyzes images of tomato leaves and classifies them into different disease categories or identifies them as healthy.

The system is designed to assist farmers, agricultural researchers, and students by providing a fast and automated method for disease diagnosis using image processing and deep learning techniques.

---

## Objectives

- Detect tomato leaf diseases using image classification.
- Automate disease identification from leaf images.
- Reduce dependency on manual inspection.
- Provide quick and reliable disease diagnosis.
- Build a foundation for future mobile/web deployment.

---

## Technologies Used

### Machine Learning & Deep Learning
- Python
- TensorFlow
- Keras
- CNN (Convolutional Neural Network)

### Data Processing
- NumPy
- Pandas

### Visualization
- Matplotlib
- Seaborn

### Model Evaluation
- Scikit-Learn

### Development Tools
- VS Code
- Jupyter Notebook

### Version Control
- Git
- GitHub

---

## Dataset Information

Dataset consists of tomato leaf images belonging to the following classes:

1. Tomato___Bacterial_spot
2. Tomato___Early_blight
3. Tomato___Late_blight
4. Tomato___Leaf_Mold
5. Tomato___Septoria_leaf_spot
6. Tomato___Spider_mites Two-spotted_spider_mite
7. Tomato___Target_Spot
8. Tomato___Tomato_Yellow_Leaf_Curl_Virus
9. Tomato___Tomato_mosaic_virus
10. Tomato___healthy

---

## Dataset Structure

```text
Dataset/
│
├── Tomato___Bacterial_spot/
├── Tomato___Early_blight/
├── Tomato___Late_blight/
├── Tomato___Leaf_Mold/
├── Tomato___Septoria_leaf_spot/
├── Tomato___Spider_mites Two-spotted_spider_mite/
├── Tomato___Target_Spot/
├── Tomato___Tomato_Yellow_Leaf_Curl_Virus/
├── Tomato___Tomato_mosaic_virus/
└── Tomato___healthy/
```

---

## System Architecture

```text
Leaf Image
     │
     ▼
Image Preprocessing
     │
     ▼
CNN Model
     │
     ▼
Feature Extraction
     │
     ▼
Classification Layer
     │
     ▼
Disease Prediction
```

---

## Project Workflow

### 1. Data Collection
- Collect tomato leaf images.
- Organize images into class folders.

### 2. Data Preprocessing
- Resize images.
- Normalize pixel values.
- Split dataset into:
  - Training Set
  - Validation Set
  - Testing Set

### 3. Data Augmentation
- Random Rotation
- Random Zoom
- Random Flip

### 4. Model Training
- Build CNN architecture.
- Train using TensorFlow/Keras.
- Monitor training and validation accuracy.

### 5. Evaluation
- Accuracy Analysis
- Loss Analysis
- Confusion Matrix
- Classification Report

### 6. Prediction
- Upload leaf image.
- Model predicts disease category.
- Display prediction confidence.

---

## CNN Architecture

The custom CNN model contains:

### Convolution Blocks
- Conv2D
- Batch Normalization
- ReLU Activation
- MaxPooling

### Dense Layers
- Fully Connected Layer
- Dropout Layer
- Softmax Output Layer

### Output Classes
- 10 Disease Categories

---

## Performance Metrics

The model is evaluated using:

- Accuracy
- Precision
- Recall
- F1-Score
- Confusion Matrix

### Sample Results

| Metric | Score |
|----------|---------|
| Validation Accuracy | ~80% |
| Test Accuracy | ~80% |

> Accuracy may vary depending on dataset size, preprocessing methods, and training parameters.

---

## Visualizations

The project generates:

### Accuracy Curve
- Training Accuracy
- Validation Accuracy

### Loss Curve
- Training Loss
- Validation Loss

### Confusion Matrix
- Class-wise prediction analysis

---

## Installation

### Clone Repository

```bash
git clone https://github.com/Shubh21das/Tomato-Disease-Detection.git
cd Tomato-Disease-Detection
```

---

### Create Virtual Environment

```bash
python -m venv .venv
```

Activate Environment:

#### Windows

```bash
.venv\Scripts\activate
```

#### Linux / Mac

```bash
source .venv/bin/activate
```

---

### Install Dependencies

```bash
pip install tensorflow
pip install numpy
pip install pandas
pip install matplotlib
pip install seaborn
pip install scikit-learn
pip install pillow
```

Or:

```bash
pip install -r requirements.txt
```

---

## Running the Project

### Training Model

Open:

```text
training/
```

Run:

```bash
jupyter notebook
```

Open training notebook and execute all cells.

---

### Loading Saved Model

```python
import tensorflow as tf

model = tf.keras.models.load_model("final_model.keras")
```

---

### Predicting Disease

```python
prediction = model.predict(image)
```

Output:

```text
Disease Name
Confidence Score
```

---

## Project Structure

```text
Tomato-Disease-Detection
│
├── Model_com/
│
├── tomato_app/
│
├── tomato_disease_app/
│
├── training/
│
├── README.md
│
├── LICENSE
│
├── FIX_GUIDE.md
│
├── QUICK_REFERENCE.md
│
└── tomato_doctor_guide.docx
```

---

## Future Enhancements

- Improve model accuracy using Transfer Learning.
- Mobile Application Development.
- Real-time disease detection.
- Cloud deployment.
- Disease treatment recommendation system.
- Multi-crop disease detection.

---

## Team Information

### Group ID: 23

### Project Title
**AI-Based Tomato Plant Disease Detection Using CNN**

---

## AI Tools Used

### ChatGPT
Used for understanding CNN concepts, debugging code, and obtaining technical guidance during development.

### Gemini AI
Used for generating ideas related to system design, diagrams, and presentation preparation.

### Claude AI
Used for documentation refinement and improving report structure.

---

## License

This project is licensed under the MIT License.

---

## Acknowledgements

- TensorFlow Team
- Keras Documentation
- PlantVillage Dataset Contributors
- Open Source Community

---

If you found this project useful, consider giving it a star on GitHub.
