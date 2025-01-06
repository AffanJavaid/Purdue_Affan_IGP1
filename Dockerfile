# Step 1: Use official Tomcat image as base
FROM tomcat:9.0-jdk11-openjdk

# Step 2: Copy the WAR file into the Tomcat webapps directory
# Assuming the WAR file will be available at build time
COPY target/*.war /usr/local/tomcat/webapps/

# Step 3: Expose the default Tomcat port
EXPOSE 8080

# Step 4: Start Tomcat server
CMD ["catalina.sh", "run"]
