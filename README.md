# ElasticSearch Vagrant Setup

Makes running ES in a vagrant instance dead simple.

# Usage

Install vagrant and a vm system (tested with virtualbox), then

`vagrant up`

Once the box is provisioned, you need to `vagrnat ssh` into the box and start ES by hand

`./elasticsearch-<VERSION>/bin/elasticsearch`

This image uses port forwarding, so you can connect to the ES instance via **http://localhost:9200**, 
the same as you would if it was running locally

# Settings

You can change the default version of ES in `provision.sh` by changing the `ESVERSION` variable
