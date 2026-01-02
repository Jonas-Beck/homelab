# Homelab

This repository contains my current homelab setup running on Raspberry Pi devices using k3s. It uses Flux for GitOps and follows the Flux monorepo structure guidelines.

## Repository Structure

### Top-level directories

- **kubernetes/** – Contains all Kubernetes and Flux GitOps manifests
- **services/** – Custom service implementations and Docker images

### Kubernetes (GitOps)

The kubernetes directory follows the Flux monorepo structure:

#### Apps

- **kubernetes/apps/** – Contains Helm releases with custom configuration per cluster
  - **kubernetes/apps/base/** – Namespaces and HelmRelease definitions
  - **kubernetes/apps/dev/** – Development Helm values

#### Infrastructure

- **kubernetes/infrastructure/** – Contains shared infrastructure components such as ingress-nginx and cert-manager
  - **kubernetes/infrastructure/controllers/** – Namespaces and HelmRelease definitions for Kubernetes controllers
  - **kubernetes/infrastructure/configs/** – Kubernetes custom resources such as certificate issuers and network policies

#### Clusters

- **kubernetes/clusters/** – Contains the Flux configuration for each cluster
  - **infrastructure.yaml** – Flux Kustomization definitions for reconciling infrastructure controllers and configs
  - **flux-system/flux-instance.yaml** – FluxInstance custom resource used to manage all Flux components
  - **apps.yaml** – Flux Kustomization definitions for reconciling the app overlays for that specific cluster

### Services

The services directory contains custom service implementations:

- **services/home-assistant/** – Custom Home Assistant Docker image with HACS pre-installed
