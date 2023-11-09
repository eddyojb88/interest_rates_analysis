FROM nvidia/cuda:11.7.1-runtime-ubuntu22.04

RUN apt-get update && apt-get install -y software-properties-common
RUN apt-get install -y g++-11 make python3 python-is-python3 pip python3.10-venv

# Rust stuff:
RUN mkdir -p /user/turreta-rust-builder/src
WORKDIR /user/turreta-rust-builder/src
 
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

COPY requirements.txt /tmp/
# RUN pip3 install -U pip setuptools wheel
RUN pip3 install --requirement /tmp/requirements.txt

ENV APP_HOME /usr/src/app
WORKDIR /$APP_HOME

COPY . $APP_HOME/

CMD tail -f /dev/null

COPY start.sh /start.sh
RUN chmod +x /start.sh

# Switching to a non-root user, please refer to https://aka.ms/vscode-docker-python-user-rights
RUN useradd appuser && chown -R appuser /usr/src/app

ENTRYPOINT [ "/start.sh" ]