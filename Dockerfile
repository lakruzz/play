FROM perl:5.24


ADD perls /perls
ENV PATH $PATH:/perls
WORKDIR app

RUN echo $PATH
