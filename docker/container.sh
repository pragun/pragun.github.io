#!/bin/bash

readonly SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
readonly SRC_DIR=$(realpath "$SCRIPT_DIR/..")

echo "script dir $SCRIPT_DIR"
echo "src path $SRC_DIR"

build_container() {
    cd $SCRIPT_DIR
    docker build -t hugo-build .
}

run_container() {
    echo "Once inside the container, build marlin by"
    echo "  hugo serve --bind 0.0.0.0"
    echo "  hugo build"
    echo "-----"
    echo " "
    docker run \
        -it --rm \
        --name hugo-build \
        -v $SRC_DIR:/site \
        -v $HOME/.ssh:/root/.ssh \
        -p 1313:1313 \
        -w /site \
        hugo-build
}

help() {
    echo "Usage: $SCRIPT_DIR [command]"
    echo "Commands:"
    echo "  build     Build the Docker image"
    echo "  run     Run the Docker container"
}

if [ "$#" -eq 0 ]; then
    help
    exit 1
fi

case "$1" in
    build)
        build_container
        ;;
    run)
        run_container
        ;;
    *)
        help
        exit 1
        ;;
esac
