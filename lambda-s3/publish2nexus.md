# Configure Gradle build to publish artifacts to Nexus

reference: https://support.sonatype.com/hc/en-us/articles/213465348-How-do-I-configure-my-Gradle-build-to-publish-artifacts-to-Nexus-

# Usage

```
# copy the gradle properties file to ~/.gradle/gradle.properties
$ mkdir ~/.gradle
$ cp gradle.properties.template ~/.gradle/gradle.properties

# Run nexus in docker
docker run -d -p 8081:8081 --name nexus sonatype/nexus:oss

# publish to nexus
./gradlew tasks
./gradlew uploadArchives
```
