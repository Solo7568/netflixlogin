# Use a base image that supports package installation
FROM centos:latest

# Install Apache (httpd)
RUN yum install -y epel-release && \
    yum install -y httpd && \
    yum clean all

# Copying project files into the container's htdocs directory
COPY index.html /var/www/html/
COPY style.css /var/www/html/
COPY images/ /var/www/html/images/

# Expose port 80
EXPOSE 80

# Start the httpd service when the container starts
CMD ["httpd-foreground"]
