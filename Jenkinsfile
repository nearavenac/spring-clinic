node {
  stage('Checkout') {
    println 'Se clona repositorio en espacio de trabajo'
    checkout scm
  }
  stage('Build') {
    println 'Se realiza build'
    sh "chmod 777 gradlew"
    sh "./gradlew build"
  }
  stage('Code Review') {
    println 'Se ejecuta análisis con SonarCloud'
    sh "set +x; ./gradlew sonarqube -Dsonar.login=be23d9995a099b614e87eedc5924ca7f4a0f0b57 -Dsonar.branch.name=feature-nicolasAravena-interfaz"
  }
  stage('Inicializar Docker'){
    println 'Habilitar docker'
    def dockerHome = tool 'myDocker'
    env.PATH = "${dockerHome}/bin:${env.PATH}"
  }
  stage('Deploy') {
    'Realizar deploy a partir de Dockerfile'
    sh 'docker build -t jenkins-lab .'
    sh 'docker run jenkins-lab'
  }
}

