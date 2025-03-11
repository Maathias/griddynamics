The app is available at https://send.mtps.pl

## Deployment

`Deployment.yml` manifest file creates a deployment with 1 replica, restricted to `vanaheim` region (it has symetrical gigabit connection to the internet). It uses `timvisee/send` image, which is a fork of Mozzilla's "Send" project, used to send E2E encrypted files.

Since the volumes are managed by Longhorn, the init container sets correct permissions for uploads directory.

Both containers are deployed in a single pod, because I don't expect redundance from it, it's only run on a single network, which itself is a single point of failue.

## Namespace and Service

Both files set-up a basic namespace, and a service for the ingress

## Volume and StorageClass

`StorageClass.yml` is the manifest of the cluster-wide class for Longhorn volumes. It enables replication, volume creation and selects correct disks.

`Volume.yml` creates a PVC for the deployment, which is bound to the Longhorn storage class.

## Ingress

The ingress is managed by ingress-nginx operator, installed on the cluster. `Ingress.yml` defines the domain, service and certificate issuer for the app.

## Issuer

For ease of use and security, the ingress uses cloudflare-origin-issuer to request a certificate from CF directly. `Issuer.yml` defines the secret to be used while fetching from CF's API.
