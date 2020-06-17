# Configure Gradle build to publish artifacts to Nexus

reference: https://support.sonatype.com/hc/en-us/articles/213465348-How-do-I-configure-my-Gradle-build-to-publish-artifacts-to-Nexus-

# Usage

```
docker run -d -p 8081:8081 --name nexus sonatype/nexus:oss
./gradlew tasks
./gradlew uploadArchives
```
