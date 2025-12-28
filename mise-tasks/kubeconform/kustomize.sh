#!/usr/bin/env bash
#MISE description="Run kustomize build for each kustomization and validate the output with kubeconform"
#MISE depends=["kubeconform:fetch-crds"]

# mirror kustomize-controller build options
kustomize_flags=("--load-restrictor=LoadRestrictionsNone")
kustomize_config="kustomization.yaml"

find . -type f -name $kustomize_config -print0 | while IFS= read -r -d $'\0' file; do
	kustomize build "${file/%$kustomize_config/}" "${kustomize_flags[@]}" |
		mise kubeconform:run
	if [[ ${PIPESTATUS[0]} != 0 ]]; then
		exit 1
	fi
done
