⸻


# 📄 RAG Chatbot (FastAPI + Streamlit + LangChain)

A **Retrieval-Augmented Generation (RAG) chatbot** built using **FastAPI** for the backend, **Streamlit** for the frontend, **LangChain** for orchestration, **ChromaDB** for vector storage, and **Groq LLMs** for inference.

---

## 🧠 Architecture Overview

- **Backend**: FastAPI  
- **Frontend**: Streamlit  
- **LLM Provider**: Groq  
- **Vector Store**: ChromaDB (persistent, volume-mounted)  
- **Embeddings**: sentence-transformers/all-MiniLM-L12-v2  
- **PDF Ingestion**: PyPDFLoader + Recursive Text Splitting  
- **Python Version**: 3.12.4  

---

## 📁 Project Structure

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

---

## 🚀 Features

- Upload PDFs and build a vector database
- Semantic search using embeddings
- Context-aware answers using Groq LLMs
- Persistent vector storage using Docker volumes
- Clean separation of frontend and backend
- Centralized logging and error handling

---

## 🔑 Environment Variables

Create a `.env` file or pass via Docker:

```env
GROQ_API_KEY=your_groq_api_key_here


⸻

📦 Installation (Local)

Create Virtual Environment

python -m venv myenv
source myenv/bin/activate

Install Dependencies

pip install -r requirements.txt


⸻

▶️ Running Locally

Start Backend (FastAPI)

cd server
uvicorn main:app --reload

Backend runs at:

http://127.0.0.1:8000

Start Frontend (Streamlit)

cd client
streamlit run app.py

Frontend runs at:

http://127.0.0.1:8501


⸻

🧪 API Endpoints

Endpoint	Method	Description
/upload_pdfs/	POST	Upload PDF documents
/ask/	POST	Ask questions to the RAG agent
/test	GET	Health check


⸻

🐳 Docker Deployment

Build Image

docker build -t rag-chatbot .

Run Container

docker run -p 8000:8000 -p 8501:8501 \
  -e GROQ_API_KEY=your_key_here \
  -v chroma_data:/app/server/chroma_store \
  rag-chatbot

Why Docker Volume?
	•	Keeps embeddings persistent across restarts
	•	Avoids rebuilding vector database every run

⸻

🧹 .dockerignore (Important)

Ignored during Docker build:
	•	Virtual environments
	•	Cache files
	•	.env
	•	chroma_store
	•	Uploaded PDFs

This keeps images secure and lightweight.

⸻

📚 Key Libraries Used
	•	LangChain
	•	ChromaDB
	•	Sentence Transformers
	•	Groq SDK
	•	FastAPI
	•	Streamlit
	•	PyPDF

⸻

⚠️ Notes
	•	OpenAI models are disabled by default
	•	Groq models are recommended for inference
	•	Ensure Docker volume is mounted for persistence

⸻

📌 Future Improvements
	•	Streaming responses
	•	Authentication
	•	Multi-user chat history
	•	Docker Compose setup
	•	Cloud deployment

⸻

---