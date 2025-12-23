# Homelab

This repository contains my current homelab setup running on Raspberry Pi devices using k3s. It uses Flux for GitOps and follows the Flux monorepo structure guidelines.

## Folder Structure

The Flux setup follows the Flux monorepo guide for structuring a repository.

### Top-level directories

- **apps/** – Contains Helm releases with custom configuration per cluster
- **infrastructure/** – Contains shared infrastructure components such as ingress-nginx and cert-manager
- **clusters/** – Contains the Flux configuration for each cluster

### Infrastructure layout

The infrastructure directory is organized into:

- **infrastructure/controllers/** – Namespaces and HelmRelease definitions for Kubernetes controllers
- **infrastructure/configs/** – Kubernetes custom resources such as certificate issuers and network policies

### Cluster configuration

Each cluster has its own directory under **clusters/**, containing:

- **infrastructure.yaml** – Flux Kustomization definitions for reconciling infrastructure controllers and configs
- **flux-system/flux-instance.yaml** – FluxInstance custom resource used to manage all Flux components
- **apps.yaml** – Flux Kustomization definitions for reconciling the app overlays for that specific cluster

### Apps configuration

The apps directory is structured into:

- **apps/base/** – Namespaces and HelmRelease definitions
- **apps/dev/** – Development Helm values
