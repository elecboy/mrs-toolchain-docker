FROM python:3-bullseye

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y wget bzip2 p7zip-full rsync tzdata cmake make ninja-build git gcc g++ && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install sh && \
    wget http://file.mounriver.com/tools/MRS_Toolchain_Linux_x64_V1.80.tar.xz -O /tmp/MRS_Toolchain_Linux_x64.tar.xz && \
    mkdir -p /opt/MRS_Toolchain && \
    tar xvf /tmp/MRS_Toolchain_Linux_x64.tar.xz -C /opt/MRS_Toolchain --strip-components 1 && \
    rm /tmp/MRS_Toolchain_Linux_x64.tar.xz

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH="${PATH}:/opt/MRS_Toolchain/RISC-V Embedded GCC/bin"
