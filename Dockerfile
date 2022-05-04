# -*- coding: utf-8 -*-
#
# Copyright (C) 2022 Sentry Club.
#
# Example Service is free software; you can redistribute it and/or modify it under
# the terms of the MIT License; see LICENSE file for more details.

FROM python:3.8-slim-buster

RUN apt-get update -y \
    && apt-get install -y git make \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /example-service

COPY . .
RUN pip install \
    poetry \
    gunicorn \
    && poetry config virtualenvs.create false \
    && poetry install

EXPOSE 5000

CMD ["gunicorn", "-w4", "--bind=0.0.0.0:5000", "example_service.service:app"]
