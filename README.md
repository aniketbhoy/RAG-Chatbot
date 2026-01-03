---

# 📄 RAG Chatbot

**FastAPI · Streamlit · LangChain · ChromaDB · Groq**

A **Retrieval-Augmented Generation (RAG) chatbot** built with **FastAPI** for the backend, **Streamlit** for the frontend, **LangChain** for orchestration, **ChromaDB** for vector storage, and **Groq LLMs** for fast inference.

---

## 🧠 Architecture Overview

* **Backend**: FastAPI
* **Frontend**: Streamlit
* **LLM Provider**: Groq
* **Vector Store**: ChromaDB (persistent via Docker volume)
* **Embeddings**: `sentence-transformers/all-MiniLM-L12-v2`
* **PDF Ingestion**: PyPDFLoader + Recursive Text Splitter
* **Python Version**: 3.12.4

---

## 📁 Project Structure

```text
RAG-CHATBOT/
├── client/                 # Streamlit frontend
│   ├── components/
│   ├── utils/
│   ├── app.py
│   └── config.py
│
├── server/                 # FastAPI backend
│   ├── modules/
│   │   ├── load_vectorstore.py
│   │   ├── llm.py
│   │   └── query_handlers.py
│   ├── chroma_store/       # Vector DB (Docker volume)
│   ├── uploaded_pdfs/      # Uploaded PDFs (runtime)
│   └── main.py
│
├── logger.py
├── requirements.txt
├── README.md
├── .env
├── .gitignore
└── Dockerfile
```

---

## 🚀 Features

* Upload PDFs and build a vector database
* Semantic document retrieval using embeddings
* Context-aware answers powered by Groq LLMs
* Persistent vector storage using Docker volumes
* Clean frontend–backend separation
* Centralized logging and robust error handling

---

## 🔑 Environment Variables

Create a `.env` file or pass variables at runtime:

```env
GROQ_API_KEY=your_groq_api_key_here
```

---

## 📦 Installation (Local)

### 1️⃣ Create a Virtual Environment

```bash
python -m venv myenv
source myenv/bin/activate   # macOS / Linux
# myenv\Scripts\activate    # Windows
```

### 2️⃣ Install Dependencies

```bash
pip install -r requirements.txt
```

---

## ▶️ Running Locally

### Start Backend (FastAPI)

```bash
cd server
uvicorn main:app --reload
```

Backend available at:

```
http://127.0.0.1:8000
```

---

### Start Frontend (Streamlit)

```bash
cd client
streamlit run app.py
```

Frontend available at:

```
http://127.0.0.1:8501
```

---

## 🧪 API Endpoints

| Endpoint        | Method | Description                    |
| --------------- | ------ | ------------------------------ |
| `/upload_pdfs/` | POST   | Upload PDF documents           |
| `/ask/`         | POST   | Ask questions to the RAG agent |
| `/test`         | GET    | Health check                   |

---

## 🐳 Docker Deployment

### Build Image

```bash
docker build -t rag-chatbot .
```

### Run Container

```bash
docker run -p 8000:8000 -p 8501:8501 \
  -e GROQ_API_KEY=your_groq_api_key_here \
  -v chroma_data:/app/server/chroma_store \
  rag-chatbot
```

### Why Use a Docker Volume?

* Preserves embeddings across container restarts
* Avoids rebuilding the vector database on every run

---

## 🧹 `.dockerignore` (Recommended)

The following should be excluded from Docker builds:

* Virtual environments
* Cache files
* `.env`
* `chroma_store`
* Uploaded PDFs

This keeps images **secure, lightweight, and reproducible**.

---

## 📚 Key Libraries Used

* LangChain
* ChromaDB
* Sentence Transformers
* Groq SDK
* FastAPI
* Streamlit
* PyPDF

---

## ⚠️ Notes

* OpenAI models are disabled by default
* Groq models are recommended for inference
* Docker volume is required for persistent vector storage

---

## 📌 Future Improvements

* Streaming responses
* Authentication and access control
* Multi-user chat history
* Docker Compose support
* Cloud deployment (AWS / Fly.io / Render)

---

## 📄 License

MIT License

---
