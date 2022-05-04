# -*- coding: utf-8 -*-
#
# Copyright (C) 2022 Sentry Club.
#
# Example Service is free software; you can redistribute it and/or modify it under
# the terms of the MIT License; see LICENSE file for more details.

setup_release: create_release associate_commits

create_release:
	sentry-cli --url $(SENTRY_URL) releases -o $(SENTRY_ORG) new -p $(SENTRY_PROJECT) $(PROJECT_VERSION)

associate_commits:
	sentry-cli --url $(SENTRY_URL) releases -o $(SENTRY_ORG) -p $(SENTRY_PROJECT) set-commits --auto $(PROJECT_VERSION)
