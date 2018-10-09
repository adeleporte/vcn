#!/bin/sh

curl -L https://github.com/vmware/govmomi/releases/download/v0.18.0/govc_linux_amd64.gz | gunzip > /usr/local/bin/govc
chmod +x /usr/local/bin/govc
#govc status

mkdir /data/Datastore/BITS
mount 10.50.0.3:/data/BITS /data/Datastore/BITS/


# GOVC
export GOVC_INSECURE=1
export GOVC_URL=https://vcsa.cpod-vcn.shwrfr.com/sdk
export GOVC_USERNAME=administrator@cpod-vcn.shwrfr.com
export GOVC_PASSWORD=OCQ9RbjFe3dCWWD!
export GOVC_DATASTORE=Datastore
export GOVC_NETWORK=VM Network
export GOVC_RESOURCE_POOL=/cPod-VCN/host/Cluster/Resources
govc about

govc import.ova --options=templates/nsx-manager.json /data/Datastore/BITS/NSX-T_2.3/nsx-unified-appliance-2.3.0.0.0.10085405.ova
govc import.ova --options=templates/vrli.json /data/Datastore/BITS/NSX-T_2.3/VMware-vRealize-Log-Insight-4.7.0-9983377_OVF10.ova
govc import.ova --options=templates/vrni-proxy.json /data/Datastore/BITS/NSX-T_2.3/VMWare-vRealize-Network-Insight-3.9.0.1536339775-proxy.ova
govc import.ova --options=templates/vrni-platform.json /data/Datastore/BITS/NSX-T_2.3/VMWare-vRealize-Network-Insight-3.9.0.1536339775-platform.ova


