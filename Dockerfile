ARG BASE_CONTAINER=condaforge/mambaforge:24.7.1-2
FROM $BASE_CONTAINER

ARG python="3.11"
ARG release="2024.9.1"

SHELL ["/bin/bash", "-c"]

ENV PATH=/opt/conda/bin:$PATH
ENV PYTHON_VERSION=${python}
ENV DASK_VERSION=${release}

RUN mamba install -y \
    "mamba>=0.27.0" \
    python=${PYTHON_VERSION} \
    nomkl \
    cmake \
    dask=${DASK_VERSION} \
    cachey \
    streamz \
    && mamba clean -tipy \
    && find /opt/conda/ -type f,l -name '*.a' -delete \
    && find /opt/conda/ -type f,l -name '*.pyc' -delete \
    && find /opt/conda/ -type f,l -name '*.js.map' -delete \
    && find /opt/conda/lib/python*/site-packages/bokeh/server/static -type f,l -name '*.js' -not -name '*.min.js' -delete \
    && rm -rf /opt/conda/pkgs

RUN mkdir /opt/app

COPY environment.yml /opt/app/environment.yml
RUN /opt/conda/bin/conda env update -f /opt/app/environment.yml

RUN /opt/conda/bin/pip install xarray intake_esm xmip gcsfs 
