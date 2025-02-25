FROM python:3.11

# Set working directory
WORKDIR /app

# Install system dependencies for OpenCV (OpenGL, video codecs, etc.)
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# Copy application files
COPY . .

# Install Python dependencies, including OpenCV and Matplotlib
RUN pip install --no-cache-dir numpy pandas scikit-learn wandb opencv-python matplotlib

# Run the script
CMD ["python", "lipi_lab5.ipynb"]
