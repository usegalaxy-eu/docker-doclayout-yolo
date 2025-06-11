FROM pytorch/pytorch:2.2.2-cuda12.1-cudnn8-runtime

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    libgl1-mesa-glx \
    && rm -rf /var/lib/apt/lists/*

# Optional: non-root user (comment out if not needed)
# RUN useradd -ms /bin/bash appuser
# USER appuser
# WORKDIR /home/appuser

WORKDIR /workspace

RUN pip install --no-cache-dir doclayout-yolo==0.0.4
RUN python -c "import doclayout_yolo"
