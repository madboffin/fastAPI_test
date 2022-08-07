from fastapi import FastAPI

app = FastAPI()

@app.get("/items/{apples}")
async def root(apples):
    return {"message":apples}