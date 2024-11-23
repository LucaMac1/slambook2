# Use Ubuntu 22.04 as the base image
FROM ubuntu:22.04

# Set non-interactive frontend to prevent tzdata and other prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    build-essential \
    cmake \
    git \
    wget \
    python3 \
    python3-pip \
    gfortran \
    g++ \
    gdb \
    bash \
    libopenblas-dev \
    libeigen3-dev \
    libboost-all-dev \
    zlib1g-dev \
    libjpeg-dev \
    libpng-dev \
    libtiff-dev \
    libwebp-dev \
    libx11-dev \
    libopencv-dev \
    liboctomap-dev \
    libceres-dev \
    libpcl-dev \
    jq \
    libepoxy-dev \
    libgl1-mesa-dev && \
    rm -rf /var/lib/apt/lists/*

# Fetch and install a specific version of CMake (hardcoded)
RUN curl -fsSL https://github.com/Kitware/CMake/releases/download/v3.24.2/cmake-3.24.2-linux-x86_64.tar.gz -o /tmp/cmake.tar.gz && \
    tar -xvzf /tmp/cmake.tar.gz -C /tmp && \
    rm -rf /usr/local/man && \
    cp -r /tmp/cmake-3.24.2-linux-x86_64/* /usr/local/ && \
    rm -rf /tmp/cmake.tar.gz /tmp/cmake-3.24.2-linux-x86_64

# Verify CMake installation
RUN cmake --version

# Clone and build Pangolin without tests
RUN git clone --recursive https://github.com/LucaMac1/Pangolin.git /tmp/Pangolin && \
    cd /tmp/Pangolin && \
    mkdir build && cd build && \
    cmake .. -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTS=OFF -DBUILD_EXAMPLES=OFF && \
    make -j$(nproc) && make install && \
    rm -rf /tmp/Pangolin

# Clone and build Sophus without tests
RUN git clone https://github.com/LucaMac1/Sophus.git /tmp/Sophus && \
    cd /tmp/Sophus && \
    mkdir build && cd build && \
    cmake .. -DCMAKE_BUILD_TYPE=Release -DBUILD_SOPHUS_TESTS=OFF && \
    make -j$(nproc) && make install && \
    rm -rf /tmp/Sophus

# Clone and build g2o without examples or tests
RUN git clone https://github.com/LucaMac1/g2o.git /tmp/g2o && \
    cd /tmp/g2o && \
    mkdir build && cd build && \
    cmake .. -DCMAKE_BUILD_TYPE=Release -DBUILD_UNITTESTS=OFF -DG2O_BUILD_EXAMPLES=OFF && \
    make -j$(nproc) && make install && \
    rm -rf /tmp/g2o

# Clone and build DBoW3 without tests
RUN git clone https://github.com/LucaMac1/DBow3.git /tmp/DBoW3 && \
    cd /tmp/DBoW3 && \
    mkdir build && cd build && \
    cmake .. -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTS=OFF && \
    make -j$(nproc) && make install && \
    rm -rf /tmp/DBoW3

# Set up GoogleTest (build only the library)
RUN git clone https://github.com/LucaMac1/googletest.git /tmp/googletest && \
    cd /tmp/googletest && \
    mkdir build && cd build && \
    cmake .. -DCMAKE_BUILD_TYPE=Release -DBUILD_GMOCK=ON && \
    make -j$(nproc) && make install && \
    rm -rf /tmp/googletest

# Clean up to reduce image size
RUN apt-get purge -y build-essential wget && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install a text editor for Git
RUN apt-get update && apt-get install -y nano && \
    git config --global core.editor "nano" && \
    rm -rf /var/lib/apt/lists/*

# Install pre-commit
RUN python3 -m pip install --no-cache-dir pre-commit

# Add your project files
COPY . /workspace

# Set up pre-commit hooks
RUN cd /workspace && \
    pre-commit install

# Set the default working directory
WORKDIR /workspace

# Customize the bash prompt to a more user-friendly format
RUN echo 'export PS1="\[\e[1;32m\]slam-dev-container:\[\e[0m\]\w\$ "' >> /root/.bashrc

# Add a default entrypoint
CMD ["bash"]
