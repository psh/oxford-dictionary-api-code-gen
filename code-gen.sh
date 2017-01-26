#!/bin/bash

java -jar swagger-codegen.jar generate --lang java -c config.json -o output -i https://developer.oxforddictionaries.com/swagger/spec/public_doc_guest.json
