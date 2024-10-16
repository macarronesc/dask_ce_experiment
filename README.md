# Dask x IBM Code Engine
This example is a use case from Julius Busecke demonstrating real-time calculation of the classic ocean temperature rise due to climate change.  Pulls data in chunks in parallel from object storage using Dask and IBM Code Engine.

1. Build image
```bash
    docker build -t dask_ce_experiment .

    docker push dask_ce_experiment
```

2. Put API KEY in cloudprovider file. More info: https://cloudprovider.dask.org/en/latest/ibm.html#authentication
# ~/.config/dask/cloudprovider.yaml

cloudprovider:
   ibm:
      api_key: "your_api_key"

3. Run the code
