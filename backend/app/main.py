from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
def health():
    return {
        "status":"ok"
    }

@app.get("/api/message")
def message():
    return {
        "message": "Hello from backend"
    }