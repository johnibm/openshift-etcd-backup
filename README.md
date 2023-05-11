# openshift-etcd-backup
Backup OpenShift etcd Database

### Testing etcd backup and restore 

References: <br>
https://cloud.redhat.com/blog/ocp-disaster-recovery-part-1-how-to-create-automated-etcd-backup-in-openshift-4.x <br>
https://docs.openshift.com/container-platform/4.12/backup_and_restore/control_plane_backup_and_restore/backing-up-etcd.html <br>

### Step 1: Implement OpenShift etcd backup via CronJob:
```
Details in etcd_backup_cronjob_pvc.yaml
```

### Step 2: Add Backup Server Deployment to copy files from control node to PVC
```
oc apply -f etcd_backup_server_deployment.yaml
```
