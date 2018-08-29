#!/bin/bash -
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
cd "$SCRIPTPATH"

docker-compose run --rm web /bin/bash -c 'rake generate:secret_token && \
    rake db:create && \
    rake db:migrate && \
    rake db:test:prepare && \
    rake assets:generate_error_pages && \
    rspec'
