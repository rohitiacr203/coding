mkdir -p /usr/src/app
cd /usr/src/app
pwd
ls
echo 'export GRADLE_HOME=/app/gradle-4.9' >> $HOME/.bashrc
echo 'export PATH=$PATH:$GRADLE_HOME/bin' >> $HOME/.bashrc
gradle wrapper --gradle-version 4.9

./gradlew build --stacktrace
pwd 
ls
./gradlew test --stacktrace
