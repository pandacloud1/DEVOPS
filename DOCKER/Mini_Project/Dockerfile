FROM ubuntu

# Install Apache & Git
RUN apt-get update && \
    apt-get install -y apache2 git     

# Pull content from Github
RUN git clone https://github.com/pandacloud1/DevopsProject.git 

# Add content inside html directory
RUN cd DevopsProject/ && \
  cp -R * /var/www/html/

# Delete the Project directory after copying the files
RUN rm -rf DevopsProject

# Start Apache
CMD ["apache2ctl", "-D", "FOREGROUND"]

# Expose port 80 of container
EXPOSE 80
