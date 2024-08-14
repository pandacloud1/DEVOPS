FROM ubuntu

# Install Apache & Git
RUN apt-get update && apt-get install -y apache2 git     

# Pull content from Github
RUN git clone https://github.com/pandacloud1/webapp1.git 

# Add content inside html directory
RUN cd webapp1/ && cp -R * /var/www/html/

# Start Apache
CMD ["apache2ctl", "-D", "FOREGROUND"]

# Expose port 80 of container
EXPOSE 80
