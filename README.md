# Capstone project: Udacity Cloud DevOps Engineer Nanodegree

## Scope of the project

A simple rolling update pipeline will take in a HTML file, pass it through a linter for testing and then get containerized, before deploying into a Kubernetes Cluster using Amazon's Elastic Kubernetes Service (EKS) in an automated fashion.

### Files required

1. A html file

2. A Dockerfile for containerization

3. A Jenkinsfile for creating the pipeline

4. A YAML file for the deployment processes for Kubernetes

### Environment setup

* Once the files are pushed to a remote repository, spin up an EC2 instance environment for managing the containerization and pipeline deployment.

* Install the necessary packages and plugins

	- Java

	- Jenkins

	- Docker

	- aws cli for Ubuntu

	- eksctl

	- kubectl

	- haskell and docker linter (hadolint)

	- tidy lint for HTML

* Clone the remote repository containing the file to the created environment (in this case from GitHub).

* Install the necessary plugins in Jenkins for creating the pipeline process.

* Configure Jenkins credentials for aws SDK as well as Docker.

* Open Blueocean for Jenkins and add the access token for GitHub in order to access the repository.

* Select the appropriate repository and create the pipeline.

* Once the pipeline is completed, ensure the loadbalancer for EKS is working as expected and access the DNS from a web browser or CURL.
