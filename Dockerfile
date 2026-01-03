# -----------------------------
# Base image
# -----------------------------
    FROM python:3.12.4-slim

    # -----------------------------
    # Environment variables
    # -----------------------------
    ENV PYTHONDONTWRITEBYTECODE=1
    ENV PYTHONUNBUFFERED=1
    
    # -----------------------------
    # Set working directory
    # -----------------------------
    WORKDIR /app
    
    # -----------------------------
    # System dependencies
    # -----------------------------
    RUN apt-get update && apt-get install -y \
        build-essential \
        && rm -rf /var/lib/apt/lists/*
    
    # -----------------------------
    # Copy requirements first (cache-friendly)
    # -----------------------------
    COPY requirements.txt .
    
    RUN pip install --no-cache-dir --upgrade pip \
        && pip install --no-cache-dir -r requirements.txt
    
    # -----------------------------
    # Copy project files
    # -----------------------------
    COPY . .
    
    # -----------------------------
    # Expose ports
    # -----------------------------
    # FastAPI
    EXPOSE 8000
    # Streamlit
    EXPOSE 8501
    
    # -----------------------------
    # Start both backend & frontend
    # -----------------------------
    CMD ["bash", "-c", "\
    uvicorn server.main:app --host 0.0.0.0 --port 8000 & \
    streamlit run client/app.py --server.port=8501 --server.address=0.0.0.0 \
    "]