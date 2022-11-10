FROM docker.io/clfoundation/sbcl:2.1.5
ARG USER=user
ARG UID=1000
ARG GID=$UID

# https://code.visualstudio.com/remote/advancedcontainers/add-nonroot-user
RUN groupadd --gid $GID $USER && \
    useradd --uid $UID --gid $GID -m $USER

USER $USER
