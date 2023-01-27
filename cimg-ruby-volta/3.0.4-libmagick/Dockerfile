FROM cimg/ruby:3.0.4

RUN curl https://get.volta.sh | bash -s
ENV PATH "$PATH:/home/circleci/.volta/bin"

RUN sudo apt update && \
  sudo apt install -y --no-install-recommends libmagickcore-dev
