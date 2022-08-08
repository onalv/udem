from fastapi import FastAPI
from mangum import Mangum
from joblib import load
from app.routers import iris
import app.models.classifier as clf


def include_router(app):
    app.include_router(iris.router)


def start_application():

    app = FastAPI(title="fastapi_demo", version="1.0")
    include_router(app)
    return app


app = start_application()
handler = Mangum(app)


@app.on_event("startup")
async def load_model():
    clf.model = load("app/models/iris_model.joblib")


# if __name__ == "__main__":
#     app = start_application()
#     uvicorn.run(app, host="0.0.0.0", port=80)
