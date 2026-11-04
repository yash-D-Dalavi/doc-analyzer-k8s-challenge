from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()

class Doc(BaseModel):
    text: str

@app.get("/")
def read_root():
    return {"status": "success", "message": "AI Document Analyzer Service Running"}

@app.get("/health")
def health():
    return {"status": "ok"}

@app.post("/analyze")
def analyze(doc: Doc):
    words = doc.text.split()
    return {"word_count": len(words), "char_count": len(doc.text)}