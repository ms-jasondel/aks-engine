# aks-engine
Playing with AKS engine deployment.

Largely based off the labs here: https://github.com/vyta/windows-containers-workshop

A few things I learned along the way:

1. How to deploy aks-engine, it's actually pretty straight forward.  aks-engine deploy --api-model xxx.json
Where xxx.json specifies overrides to the default config.   

2. How taints and tolerations work together.  
Use nodeSelector in pod spec to select a windows node, but you taint the windows node so that it doesn't pick up non-windows pods.  In order to respect the taint, the windows pod spec also needs the toleration defined.  See: iis-2019-with-logging.yaml for this.

3. A service can have all sorts of different pods, i.e. nginx, different windows pods, etc... all from different deployments so long as it matches on the selector.  I wanted to test this out so I created 3 different types of pods all serving on port 80 that would get picked up by a single service with a selector of app: iis-2019.  Of course the nginx pod wasn't iis, but nonetheless I labeled it that way.

4. Deploying fluentD as a side cars is a way of getting logs written to IIS log files to forward to STDOUT and hence be able to use kubectl logs ...

5. Another nifty thing was being able to switch between clusters easily with kubeconfig.  
export KUBECONFIG=_output/<name>/kubeconfig/kubeconfig.eastus.json
  Switches the current context of your kubeconfig to the cluster created by aks engine without permanently merging into your kubeconfig file.
  
