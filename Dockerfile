# Use the official CentOS image as the base image
FROM centos:latest

# Set the maintainer label
LABEL maintainer="prasanth"

# Install required packages (httpd, zip, unzip)
RUN yum install -y httpd zip unzip && \
    yum clean all

# Create a directory to store your web application files
RUN mkdir -p /var/www/html

# Download the photogenic.zip file and unzip it
WORKDIR /var/www/html
ADD https://www.free.css.com/assests/free-css-templates/download/page254/photogenic.zip .
RUN unzip photogenic.zip && \
    rm -f photogenic.zip

# Start Apache HTTP Server
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# Expose port 80 for HTTP traffic
EXPOSE 80 22
