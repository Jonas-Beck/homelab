#!/usr/bin/env bash
#MISE description="Fetch all custom CRD JSON schemas used for kubeconform validation"

# TODO: Look into caching using something like etag to avoid fetching everytime kubeconform is called

SCHEMA_DIR="/tmp/flux-crd-schemas/master-standalone-strict"

if [[ ! -d "$SCHEMA_DIR" ]]; then
	echo "Fetching Flux CRD schemas..."
	mkdir -p "$SCHEMA_DIR"
	curl -sL https://github.com/fluxcd/flux2/releases/latest/download/crd-schemas.tar.gz |
		tar zxf - -C "$SCHEMA_DIR"
else
	echo "Using cached CRD schemas at $SCHEMA_DIR"
fi
