#FROM alpine:latest as base
#RUN apk add --update py-pip

FROM ubuntu-latest as base
RUN apt-get update && apt-get install -y python3-pip

RUN pip install --upgrade pip
RUN pip install pipenv

COPY Pipfile .
COPY Pipfile.lock .

RUN pipenv install --system --deploy

FROM base AS runtime
EXPOSE 5000
COPY . .
CMD ["flask", "run", "--host", "0.0.0.0"]