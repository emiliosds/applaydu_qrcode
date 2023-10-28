FROM python:3.10.12-alpine as base

RUN pip install pipenv

COPY Pipfile .
COPY Pipfile.lock .

RUN pipenv install --system --deploy

FROM base AS runtime
EXPOSE 5000
COPY . .
CMD ["flask", "run", "--host", "0.0.0.0"]