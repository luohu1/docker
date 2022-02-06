#!/bin/bash

docker build --force-rm -t ipyth/kubectl:1.23.3-alpine-3.14 .

docker push ipyth/kubectl:1.23.3-alpine-3.14
