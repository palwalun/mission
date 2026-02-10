pipeline{
agent any
  stages{
   stage('Checkout'){
    steps{
	 checkout scm
	}
   }
   stage('Build'){
    steps{
	 sh 'mvn clean package -DskipTests'
	}
   }
   stage('Build Docker Image'){
    steps{
	 sh 'docker build -t mission:latest .'
	}
   }
    stage('Login to ACR') {
       steps {
         withCredentials([usernamePassword(
             credentialsId: 'acr-creds',
             usernameVariable: 'ACR_USER',
             passwordVariable: 'ACR_PASS'
         )]) {
             sh '''
               echo $ACR_PASS | docker login $ACR_LOGIN_SERVER \
               -u $ACR_USER --password-stdin
             '''
           }
          }
         }
	    stage('Tag Image') {
        steps {
         sh '''
           docker tag ${IMAGE_NAME}:${TAG} \
           $ACR_LOGIN_SERVER/${IMAGE_NAME}:${TAG}
         '''
          }
        }
		stage('Push Image to ACR'){
	     steps{
	    sh 'docker push $ACR_LOGIN_SERVER/${IMAGE_NAME}:${TAG}'
	    }
	   }
	   stage('Deploy to pord'){
		steps{
		 sh '''
		 kubectl apply -f deployment.yml
		 kubectl apply -f ingress.yml
		 '''
		}
	   }
  
  }
}