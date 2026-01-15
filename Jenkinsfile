pipeline{
 agent { label 'agent1'}
 
 stages{
  stage('Checkout'){
   steps{
   checkout scm
   }
  
  }
 
 
 }
 post{
  always{
   cleanWs()
  }
 
 
 }




}