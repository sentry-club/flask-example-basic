# -*- coding: utf-8 -*-
#
# Copyright (C) 2022 Sentry Club.
#
# Example Service is free software; you can redistribute it and/or modify it under
# the terms of the MIT License; see LICENSE file for more details.

export $(cat .env | xargs)

docker-compose up -d
