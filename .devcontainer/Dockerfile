# Make sure RUBY_VERSION matches the Ruby version in .ruby-version
ARG RUBY_VERSION=3.4.4
FROM ghcr.io/rails/devcontainer/images/ruby:$RUBY_VERSION
# FROM ghcr.io/divniy/devcontainers/images/ruby:$RUBY_VERSION
# USER root
# RUN echo 'Acquire::HTTP::Proxy "http://host.docker.internal:3142";' >> /etc/apt/apt.conf.d/01proxy \
#  && echo 'Acquire::HTTPS::Proxy "false";' >> /etc/apt/apt.conf.d/01proxy
# USER vscode