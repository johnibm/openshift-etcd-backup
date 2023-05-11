#oc exec $(oc get pods -lapp.kubernetes.io/name=openshift-etcd-backup-server -ojsonpath="{.items[0].metadata.name}" -n ocp-etcd-backup) -c server -n ocp-etcd-backup -- la -la
oc exec $(oc get pods -l app=openshift-etcd-backup-server -ojsonpath="{.items[0].metadata.name}" -n ocp-etcd-backup) -c server -n ocp-etcd-backup -- ls -la

node=master-1
server_pod=$(oc get pods -l app=openshift-etcd-backup-server -ojsonpath="{.items[0].metadata.name}")

oc debug node/$node -T -- chroot /host sh -c "server_pod=$(oc get pods -l app=openshift-etcd-backup-server -ojsonpath="{.items[0].metadata.name}") && echo $server_pod"
oc debug node/master-1 -T -- chroot /host sh -c "oc get pods -l app=openshift-etcd-backup-server -ojsonpath="{.items[0].metadata.name}""

oc debug node/$node -T -- chroot /host sh -c "oc cp /home/core/backup $server_pod:/openshift_etcd_backup/"


#initContainer
node=$(oc get node --no-headers -ojsonpath="{.items[0].metadata.name}")
server_pod=$(oc get pods -l app=openshift-etcd-backup-server -ojsonpath="{.items[0].metadata.name}")
oc debug node/$node -T -- chroot /host sh -c "oc cp /home/core/backup $server_pod:/openshift_etcd_backup/"

# Check results

oc create job job-"`date +"%m-%d-%Y-%H-%M-%S"`"-backup --from=cronjob/openshift-etcd-backup

