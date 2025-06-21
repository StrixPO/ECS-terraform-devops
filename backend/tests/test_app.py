from fastapi.testclient import TestClient
from app.main import app 

client = TestClient(app)

def test_health():
    res  = client.get("/health")
    assert res.status_code == 200
    assert res.json()["status"] == "ok"

def test_message():
    res = client.get("/api/message")
    assert res.status_code == 200
    assert "message" in res.json 