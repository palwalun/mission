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
  failure{
   mail to: walunjpallavi69@gmail.com
         subject: 'Build Failed',
		 body: 'Check Jenkins Console Logs'
  
  }
 
 }




}