# openshift-etcd-backup
Project to test OpenShift etcd database backup

### Testing etcd backup and restore 
This approach will use the recommnended etcd backup methodolgy from Redhat along with an extra process to move etcd backup data to an external PVC.<br>

### Step 1: Implement OpenShift etcd backup via CronJob:
Details in [etcd_backup_cronjob.yaml](/etcd_backup_cronjob.yaml)

### Step 2: Add Backup Server Deployment to copy files from control node to PVC
```
oc apply -f etcd_backup_server_deployment.yaml
```
### Step 3: Restore
Work in Progress

### References
https://cloud.redhat.com/blog/ocp-disaster-recovery-part-1-how-to-create-automated-etcd-backup-in-openshift-4.x <br>
https://docs.openshift.com/container-platform/4.12/backup_and_restore/control_plane_backup_and_restore/backing-up-etcd.html <br>
https://access.redhat.com/documentation/en-us/openshift_container_platform/4.12/html-single/backup_and_restore/index#disaster-recovery <br>
https://access.redhat.com/solutions/5599961 <br>
https://access.redhat.com/solutions/5843611 <br>
https://github.com/lgchiaretto/openshift4-backup-automation <br>