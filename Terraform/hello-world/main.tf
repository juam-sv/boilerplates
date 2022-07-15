resource "null_resource" "node1" {
    # add provisioners here
    provisioner "local-exec" {
        command = "echo >> ${path.module}/node1.txt"
    }

    provisioner "local-exec" {
        command = "rm ${path.module}/node1.txt"
        when = destroy
    }
}