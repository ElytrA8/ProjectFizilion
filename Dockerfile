# inherit prebuilt image
FROM elytra8/projectfizilion:latest

# env setup
RUN mkdir /Fizilion && chmod 777 /Fizilion
ENV PATH="/Fizilion/bin:$PATH"
WORKDIR /Fizilion

# clone repo
RUN git clone https://github.com/ElytrA8/ProjectFizilion -b dragon /Fizilion

# install required pypi modules
RUN pip3 install -r requirements.txt

#aria2c port Exposure
EXPOSE 80 443

# Finalization
CMD ["python3","-m","userbot"]
