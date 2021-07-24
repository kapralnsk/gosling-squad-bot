FROM python:3.9-slim

# Use "RUN adduser -D -g '' newuser" for alpine
RUN adduser --disabled-password --gecos '' gosling

WORKDIR /opt/gosling

ENV VIRTUAL_ENV=/opt/gosling/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

COPY requirements.txt .
RUN pip install \
    --trusted-host pypi.python.org \
    --disable-pip-version-check \
    -r requirements.txt

COPY src src/
COPY crontab.yaml crontab.yaml
COPY gosling.jpg gosling.jpg

USER gosling

ENTRYPOINT ["yacron", "-c", "crontab.yaml"]