# ElasticSearch Vagrant Setup

Makes running Elasticsearch dead simple.

Your cluster will run in a [vagrant](https://www.vagrantup.com/) instance, which uses [esvm](https://github.com/simianhacker/esvm) to manage Elasticsearch, making storing cluster configurations a breeze.

This image uses port forwarding, so you can connect to the Elasticsearch instance via **http://localhost:9200**, the same as you would if it was running locally.

# Configuration

Configure your cluster settings by modifying `esvmrc.json`. Consult the [esvm docs](https://github.com/simianhacker/esvm#configuration) for any help with configuration.

Also, if you need to open other ports or change memory allowances or anything, now's a good time to modify the `Vagrantfile`. You can consult [their docs](https://docs.vagrantup.com/v2/vagrantfile/index.html) if needed, but it should be pretty easy to make changes with no prior knowledge.

**NOTE:** If you already ran `vagrant up`, you'll need to run `vagrant reload` to activate any changes you make to this file.

# Installation

Now, install vagrant and a supported virtual machine (hello, [virtualbox](https://www.virtualbox.org/)), then run `vagrant up`.

Now sit back and watch it do its thing. Easy, eh?

# Usage

Once the box is provisioned, you need to log in to the box and start `esvm` by hand using the one of the clusters you specified in your `esvmrc.json` file.

From your current machine, run `vagrant ssh`

Once you're logged in to the server instance:

```
cd /vagrant
esvm -c esvmrc.json <cluster name>
```

If you need to add another cluster setting or anything, just modify the `esvmrc.json` file and restart esvm.

# Advanced Settings

The Vagrant installer uses the `provision.sh` file to provision the server and set everything up. If you need other apps installed, check that out.

This is currently set up to run esvm via iojs, and if you need to but your version of node/iojs, this is the place to do it.

**NOTE:** To get this script to run again, you need to recreate the vagrant instance. Running `vagrant destroy` and then `vagrant up` will do the trick.