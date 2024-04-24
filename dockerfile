FROM python:3
COPY . /TP1_PRACTICA_3
WORKDIR /TP1_PRACTICA_3
RUN pip install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["app.py"]
