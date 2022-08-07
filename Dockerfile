FROM python:3.10-slim-bullseye

WORKDIR /home/app

# install requirements
COPY requirements.txt .
RUN python -m pip install -r requirements.txt

# copy filetree
COPY . /home/app

# non root user
RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /home/app
USER appuser

ENTRYPOINT uvicorn --host 0.0.0.0 main:app --reload
#CMD ["python", "app.py"]