pipeline {
  agent any 
  stages {
    stage('Start pipeline') {
      steps {
        sh 'echo Starting Jenkins pipeline build'
      }
    }
    stage('Lint file') {
      steps {
        sh 'tidy -q -e index.html'
      }
    }
    stage('Lint Dockerfile') {
      steps {
        sh 'hadolint Dockerfile'
      }
    }
    stage('Build Docker image') {
      steps {
         sh 'docker build -t udacitycapstone .'
      }
    }
    stage('Push docker image'){
      steps {
        withDockerRegistry([url: '', credentialsId: 'docker']) {
          sh 'docker tag udacitycapstone akshayhs/udacitycapstone'
          sh 'docker push akshayhs/udacitycapstone'
        }
      }
    }
    stage('Create Kubernetes cluster') {
      steps {
        sh 'echo creating EKS cluster'
        withAWS(credentials: 'aws', region: 'ap-south-1') {
        sh '''eksctl create cluster \
            --name capstone \
            --region ap-south-1 \
            --nodegroup-name capstone-nodes \
            --nodes 3 \
            --nodes-min 1 \
            --nodes-max 4 \
            --ssh-access \
            --ssh-public-key ec2key_capstoneinstance \
            --managed'''
        }
      } 
    }
    stage('Create config file for the cluster') {
      steps {
        withAWS(credentials: 'aws', region: 'ap-south-1') {
        sh 'aws eks --region ap-south-1 update-kubeconfig --name capstone'
        } 
      }
    }
    stage('Apply deployment for the clusters') {
      steps {
        withAWS(credentials: 'aws', region: 'ap-south-1') {
        sh 'kubectl apply -f deployment.yml'
        } 
      }
    }
    stage('Access the created clusters') {
      steps {
        withAWS(credentials: 'aws', region: 'ap-south-1') {
        sh 'kubectl get nodes'
        sh 'kubectl get deployment'
        sh 'kubectl get pod -o wide'
        sh 'kubectl get service/capstone'
        } 
      }
    }
    stage('Clean up processes') {
      steps {
        echo 'Clean-up process initiated'
        sh 'docker system prune'
      }
    }
  }
}
