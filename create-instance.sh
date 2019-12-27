#!/bin/bash

gcloud compute instances create jupyter-image-2019-12-27 --image-project=ubuntu-os-cloud --image-family=ubuntu-1804-lts --boot-disk-size=20G --boot-disk-auto-delete --machine-type=n1-standard-2 --zone=us-central1-a
