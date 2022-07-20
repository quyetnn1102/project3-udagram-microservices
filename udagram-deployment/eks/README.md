# Elastic Kubernetes Service (Amazon EKS)

## Create your cluster

Create your cluster with `eksctl` by running the running the following script or the [official guide](https://eksctl.io/usage/creating-and-managing-clusters/).

```bash
eksctl create cluster -f eksclusterconfig.yaml
```

`eksclusterconfig.yaml` follows the [schema described here](https://eksctl.io/usage/schema/)

You get this output:
![eksclustercreation](../../screenshots/eksclustercreation.png)

Your cluster is created and visible in the [AWS Console/EKS](https://eu-west-3.console.aws.amazon.com/eks/home#/clusters):
![eksclusterconsole](../../screenshots/eksclusterconsole.png)

## Delete your cluster

Create your cluster with `eksctl` by running the running the following script or the [official guide](https://docs.aws.amazon.com/eks/latest/userguide/delete-cluster.html).

```bash
eksctl delete cluster -f eksclusterconfig.yaml
```
