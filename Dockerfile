#ARG ARCH=amd64

FROM --platform=linux/amd64 ubuntu

ENV TZ=Europe/Berlin
ENV LANG en_US.utf8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y -f \
  wget curl locales git rsync vim bsdmainutils gdb time \
  autoconf automake autotools-dev libmpc-dev libmpfr-dev python3 ninja-build libgmp-dev gawk gperf build-essential bison flex texinfo libgoogle-perftools-dev libtool patchutils bc zlib1g-dev libexpat-dev libboost-iostreams-dev libboost-program-options-dev libboost-log-dev \
  && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 \
  && rm -rf /var/lib/apt/lists/* 
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen
#RUN apt-get install verilator

ARG USERNAME=hazem
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    #
    # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME


USER $USERNAME

WORKDIR /home/hazem

RUN wget -O Miniforge3.sh "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
RUN bash Miniforge3.sh -b -p "${HOME}/conda"

ENV CONDA_EXE='/home/hazem/conda/bin/conda'
ENV _CE_M=''
ENV _CE_CONDA=''
ENV CONDA_SHLVL='0'
ENV CONDA_PYTHON_EXE='/home/hazem/conda/bin/python'
ENV PATH /home/hazem/conda/condabin:$PATH

RUN git clone https://github.com/HazemAlindari/chipyardDocker.git
#SHELL ["/bin/bash", "-cl"]
RUN . chipyardDocker/installChipyardWithTools.sh

ENTRYPOINT ["chipyardDocker/entrypoint.sh"]
