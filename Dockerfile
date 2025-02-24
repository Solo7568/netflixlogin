# Use a base image that supports package installation
FROM centos:latest

# Modify the repository configuration to use CentOS Vault
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-* && \
    yum update -y

# Install Apache (httpd)
RUN yum install -y epel-release && \
    yum install -y httpd && \
    yum clean all

# Copy your project files into the container's htdocs directory
COPY index.html /var/www/html/
COPY style.css /var/www/html/
COPY images/ /var/www/html/images/

# Expose port 80
EXPOSE 80

# Start the httpd service when the container starts
CMD ["httpd", "-D", "FOREGROUND"]
