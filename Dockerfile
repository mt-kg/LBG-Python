#Use Python 3.11 as a base image
FROM python:3.11

# Copy contents into image
 COPY . .

# install pip dependencies from requirements file
 RUN pip install -r requirements.txt

#Env variable for DB password
#ENV PORT="8081"

# Expose correct port
#EXPOSE 8080

# Create an entrypoint
ENTRYPOINT [ "python", "lbg.py" ]