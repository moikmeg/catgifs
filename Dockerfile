FROM alpine:3.5
RUN apk update
RUN apk add py2-pip
COPY requirements.txt /usr/src/app/
RUN pip install --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host files.pythonhosted.org  --no-cache-dir -r /usr/src/app/requirements.txt
COPY app.py /usr/src/app/
COPY templates/index.html /usr/src/app/templates/
COPY static/styles/main.css /usr/src/app/static/styles/
COPY static/images/* /usr/src/app/static/images/
EXPOSE 5000
CMD ["python", "/usr/src/app/app.py"]

