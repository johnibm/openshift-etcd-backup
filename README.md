# openshift-etcd-backup
Backup OpenShift etcd database


# Introduction
Testing etcd backup and restore
Reference:
https://cloud.redhat.com/blog/ocp-disaster-recovery-part-1-how-to-create-automated-etcd-backup-in-openshift-4.x

## Step 1: Implement OpenShift etcd backup via CronJob:
```
Details in etcd_backup_cronjob_pvc.yaml
```

## Step 2: Add Backup Server Deployment to copy files from control node to PVC
```
oc apply -f etcd_backup_server_deployment.yaml
```
