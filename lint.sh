#!/usr/bin/env bash

xmllint --noout --dtdvalid countries/schema.dtd countries/*.xml
xmllint --noout --relaxng countries/schema.rng countries/*.xml
