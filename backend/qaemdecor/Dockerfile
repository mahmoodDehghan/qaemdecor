FROM python:3.9

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

WORKDIR /code
ENV PYTHONPATH=${PYTHONPATH}:${PWD}

RUN python -m pip install --upgrade pip

COPY poetry.lock pyproject.toml /code/

RUN pip install poetry
RUN poetry config virtualenvs.create false && poetry install --no-dev

COPY . /code/
