FROM elytra8/projectfizilion:latest

RUN mkdir /Fizilion && chmod 777 /Fizilion
ENV PATH="/Fizilion/bin:$PATH"
WORKDIR /Fizilion

RUN git clone https://github.com/ElytrA8/ProjectFizilion -b dragon /Fizilion

#
# Copies session and config(if it exists)
#
COPY ./sample_config.env ./userbot.session* ./config.env* ./sourceforge.sh /Fizilion/
RUN chmod 777 /Fizilion/sourceforge.sh

#transfer
RUN curl -sL https://git.io/file-transfer | sh 
RUN mkdir -p /Fizilion/transferbin && chmod 777 /Fizilion/tranferbin
RUN mv ./transfer /Fizilion/transferbin/
RUN chmod 777 /Fizilion/transferbin/transfer
ENV PATH="/Fizilion/transferbin:$PATH"

#
# Finalization
#
CMD ["python3","-m","userbot"]
