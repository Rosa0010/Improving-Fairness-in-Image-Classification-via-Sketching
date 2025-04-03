# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Copy the run_all.sh script into the container
COPY run_all.sh /app/run_all.sh

# Make the run_all.sh script executable
RUN chmod +x /app/run_all.sh

# Upgrade pip to the latest version
RUN pip install --no-cache-dir --upgrade pip

# Install any needed packages specified in the requirements.txt
RUN pip install --no-cache-dir -r face_image_classification\(CelebA\)/requirements.txt

# Install additional dependencies for image processing
# RUN apt-get update && \
#     apt-get install -y --no-install-recommends \
#     build-essential \
#     libgl1-mesa-glx \
#     libglib2.0-0 \
#     && rm -rf /var/lib/apt/lists/*


RUN apt-get update || true && \
    apt-get install -y --no-install-recommends tzdata && \
    rm -rf /var/lib/apt/lists/* && \
    dpkg-reconfigure -f noninteractive tzdata && \
    apt-get update --allow-releaseinfo-change && \
    apt-get install -y --no-install-recommends \
    build-essential \
    libgl1-mesa-glx \
    libglib2.0-0 && \
    rm -rf /var/lib/apt/lists/*


# Run the training script
# CMD ["python", "face_image_classification(CelebA)/train_resnet.py"]

# Run the shell script to execute multiple scripts
CMD ["/app/run_all.sh"]