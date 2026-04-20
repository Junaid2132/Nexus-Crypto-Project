from fastapi import FastAPI
app = FastAPI()

@app.get("/")
def home():
    return {"status": "Nexus-Crypto API is running"}

@app.get("/health")
def health():
    return {"status": "Healthy"}