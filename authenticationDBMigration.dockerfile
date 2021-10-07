FROM python:3

RUN mkdir -p /opt/src/authentication
WORKDIR opt/src/authentication

COPY authentication/migrate.py ./migrate.py
COPY authentication/configuration.py ./configuration.py
COPY authentication/models.py ./models.py
COPY ./roleCheck.py ./roleCheck.py
COPY authentication/utils.py ./utils.py
COPY ./requirements.txt ./requirements.txt

RUN pip install -r ./requirements.txt

# RUN rm -rf ./migrations

ENTRYPOINT ["python", "./migrate.py"]