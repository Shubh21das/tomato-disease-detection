import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt
import json
import os

# ============================================================
#  CHANGE THESE TWO PATHS ONLY
# ============================================================
MODEL_PATH      = r"D:\Major_Project_2\training\best_tomato_disease_model.keras"   # your saved model
IMAGE_PATH      = r"D:\Major_Project_2\Dataset_Balanced\Tomato___Tomato_mosaic_virus\0a7cc59f-b2b0-4201-9c4a-d91eca5c03a3___PSU_CG 2230.JPG" # image to predict
# ============================================================

IMAGE_SIZE = 224  # must match what you trained with

# Load model
print("Loading model...")
model = tf.keras.models.load_model(MODEL_PATH)
print("✅ Model loaded!\n")

# Class names — same order as your dataset folders
class_names = [
    "Tomato__Bacterial_spot",
    "Tomato__Early_blight",
    "Tomato__Late_blight",
    "Tomato__Leaf_Mold",
    "Tomato__Septoria_leaf_spot",
    "Tomato__Spider_mites Two-spotted_spider_mite",
    "Tomato__Target_Spot",
    "Tomato__Tomato_Yellow_Leaf_Curl_Virus",
    "Tomato__Tomato_mosaic_virus",
    "Tomato__healthy"
]

def predict(img_path):
    # Load and preprocess
    img       = tf.keras.preprocessing.image.load_img(img_path, target_size=(IMAGE_SIZE, IMAGE_SIZE))
    img_array = tf.keras.preprocessing.image.img_to_array(img)
    img_array = img_array / 255.0                   # same normalization as training
    img_array = np.expand_dims(img_array, axis=0)   # add batch dimension

    # Predict
    predictions = model.predict(img_array, verbose=0)[0]
    top_indices = np.argsort(predictions)[-3:][::-1] # top 3

    # Show result
    plt.figure(figsize=(12, 5))

    plt.subplot(1, 2, 1)
    plt.imshow(img)
    plt.title("Input Image")
    plt.axis("off")

    plt.subplot(1, 2, 2)
    top_labels = [class_names[i].split("__")[-1].replace("_", " ") for i in top_indices]
    top_probs  = [predictions[i] * 100 for i in top_indices]
    colors     = ["#2ecc71" if i == 0 else "#3498db" for i in range(3)]
    bars = plt.barh(top_labels[::-1], top_probs[::-1], color=colors[::-1])
    for bar, prob in zip(bars, top_probs[::-1]):
        plt.text(bar.get_width() + 1, bar.get_y() + bar.get_height()/2,
                 f"{prob:.1f}%", va="center")
    plt.xlabel("Confidence (%)")
    plt.title("Top 3 Predictions")
    plt.xlim(0, 100)
    plt.tight_layout()
    plt.show()

    print(f"🏆 Predicted : {class_names[top_indices[0]]}")
    print(f"   Confidence: {predictions[top_indices[0]]*100:.2f}%")
    print()
    print("Top 3:")
    for i, idx in enumerate(top_indices):
        print(f"  {i+1}. {class_names[idx]:<50} {predictions[idx]*100:.2f}%")

# Run prediction
if os.path.exists(IMAGE_PATH):
    predict(IMAGE_PATH)
else:
    print(f"⚠️  Image not found: {IMAGE_PATH}")
    print("Please update IMAGE_PATH at the top of this file")
