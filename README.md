# Dask x IBM Code Engine
This repository contains an example use case, contributed by Julius Busecke, that demonstrates the real-time calculation of ocean temperature rise due to climate change. The implementation utilizes Dask and IBM Code Engine to scale the workload parallel.

## Steps for Setup and Execution
### 1. Build and Push Docker Image
To begin, you will need to build the Docker image and push it to your chosen container registry. Use the following commands:

```bash
docker build -t dask_ce_experiment .
docker push dask_ce_experiment
```

### 2. Configure Authentication
In order to interact with IBM Cloud services, an API key is required. Ensure that you have configured your `cloudprovider.yaml` file, located in `~/.config/dask/cloudprovider.yaml`. The configuration should include the IBM API key as shown below:

```yaml
cloudprovider:
  ibm:
    api_key: "your_api_key"
```

For further details regarding authentication, refer to the [official Dask Cloud Provider documentation](https://cloudprovider.dask.org/en/latest/ibm.html#authentication).

### 3. Execute the Code
Once the environment is set up and the configuration is in place, you can proceed to run the example code to compute ocean temperature rise in parallel using Dask and IBM Code Engine.


> **❗️Note:❗️** Install the latest [GitHub](https://github.com/dask/dask-cloudprovider) version of Dask Cloud Provider, since it contains some necessary modifications that are not in the latest stable version.