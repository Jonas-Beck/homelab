#!/usr/bin/env bash
#MISE description="Run Kubeconform with predefined flags for custom CRD schemas"
#MISE depends=["kubeconform:fetch-crds"]

# Skip Kubernetes Secrets due to SOPS fields failing validation.
# Skip Kustomization due to issues with schemas on non flux Kustomization
kubeconform_flags=("-skip=Secret,Kustomization")
kubeconform_config=(
	"-strict"
	"-schema-location" "default"
	"-schema-location" "/tmp/flux-crd-schemas"
	"-schema-location" "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/{{.Group}}/{{.ResourceKind}}_{{.ResourceAPIVersion}}.json"
	"-verbose"
)

# Run kubeconform with predefined flags and any additional arguments passed to this script.
kubeconform "${kubeconform_flags[@]}" "${kubeconform_config[@]}" "$@"
