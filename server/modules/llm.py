import os
from dotenv import load_dotenv
from langchain_groq import ChatGroq
from langchain_classic.chains.retrieval_qa.base import RetrievalQA


load_dotenv()

GROQ_API_KEY=os.environ.get('GROQ_API_KEY')

# def get_llm_chain(vectorstore):
#     llm=ChatGroq(
#         groq_api_key=GROQ_API_KEY,
#         model_name='llama3-70b-8192'
#         )
#     retriever=vectorstore.as_retriever(search_kwargs={'k':3})
#     return RetrievalQA.from_chain_type(
#         llm=llm,
#         chain_type='stuff',
#         retriever=retriever,
#         return_source_documents=True
#     )
from langchain_groq import ChatGroq
from langchain_classic.chains import create_retrieval_chain
from langchain_classic.chains.combine_documents import create_stuff_documents_chain
from langchain_classic.prompts import ChatPromptTemplate

def get_llm_chain(vectorstore):
    llm = ChatGroq(model="llama-3.3-70b-versatile")

    retriever = vectorstore.as_retriever(search_kwargs={"k": 3})

    prompt = ChatPromptTemplate.from_template(
        """Answer the question based only on the context below:
        {context}
        Question: {input}"""
    )

    doc_chain = create_stuff_documents_chain(llm, prompt)

    return create_retrieval_chain(retriever, doc_chain)