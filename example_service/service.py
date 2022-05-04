# -*- coding: utf-8 -*-
#
# Copyright (C) 2022 Sentry Club.
#
# Example Service is free software; you can redistribute it and/or modify it under
# the terms of the MIT License; see LICENSE file for more details.

import os

from flask import Flask, request, jsonify

import sentry_sdk
from sentry_sdk.integrations.flask import FlaskIntegration

from .version import __version__ as package_version
from .processors import do_some_numerical_task


#
# 1. Configuring the Flask App
#
app = Flask(__name__)

#
# 2. Configuring the Sentry SDK
#

# Sentry - Data Source Name (DSN)
sentry_dsn = os.getenv("SENTRY_DSN")

# Sentry - Environment
sentry_tag_environment = os.getenv("SENTRY_TAG_ENVIRONMENT", "development")

# Sentry - Release
sentry_tag_release = os.getenv("SENTRY_TAG_RELEASE", package_version)

# Sentry - SDK Initialization
sentry_sdk.init(
    dsn=sentry_dsn,
    integrations=[FlaskIntegration()],
    # Set traces_sample_rate to 1.0 to capture 100%
    # of transactions for performance monitoring.
    # We recommend adjusting this value in production.
    traces_sample_rate=1.0,
    environment=sentry_tag_environment,
    release=sentry_tag_release,
)

#
# 3. Application routes
#
@app.route("/", methods = ["GET"])
def processor():
    """Processor resource."""

    # args
    method = request.args.get("method", None)

    if method:
        raise RuntimeError("The selected method is overloading the server!")

    # running the task
    result = do_some_numerical_task()

    return jsonify({
        "service": "Flask Sentry Example",
        "version": package_version,
        "task": {
            "result": result
        }
    })
