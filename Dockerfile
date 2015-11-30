FROM python:3.5
EXPOSE 5000
WORKDIR /app
COPY . /app
RUN [".shipped/build"]
CMD .shipped/run
