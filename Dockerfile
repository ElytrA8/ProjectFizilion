FROM elytra8/projectfizilion:latest

RUN mkdir /Fizilion && chmod 777 /Fizilion
ENV PATH="/Fizilion/bin:$PATH"
WORKDIR /Fizilion

RUN git clone https://github.com/ElytrA8/ProjectFizilion -b dragon /Fizilion

#
# Copies session and config(if it exists)
#
COPY ./sample_config.env ./userbot.session* ./config.env* /Fizilion/
#transfer

RUN curl -sL https://git.io/file-transfer | sh

#
# Finalization
#
CMD ["python3","-m","userbot"]
