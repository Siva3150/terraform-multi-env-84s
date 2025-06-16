resource "aws_instance" "roboshop" {
    count = length(var.instances)
    instance_type = lookup(var.instance_type, terraform.workspace)
    ami = var.ami_id
    vpc_security_group_ids = [aws_security_group.allow_all.id]

    tags = merge(
        var.common_tags,
        {
            Name = "${var.project_name}-${var.instances[count.index]}-${terraform.workspace}"
             Component = var.instances[count.index]
             Environment = terraform.workspace
        }
    )

}




# ALLOW ALL SG
resource "aws_security_group" "allow_all" {
name = "${var.project_name}-${var.sg_name}-${terraform.workspace}" # allow-all-dev
description = var.sg_description
    

ingress {
    from_port = var.from_port
    to_port = var.to_port
    protocol = "-1"
    cidr_blocks = var.cidr_blocks
     ipv6_cidr_blocks = ["::/0"]
}

egress {
    from_port = var.from_port
    to_port = var.to_port
    protocol = "-1"
    cidr_blocks = var.cidr_blocks
     ipv6_cidr_blocks = ["::/0"]
}

tags = merge(
    var.common_tags,
    {
        Name = "${var.project_name}-${var.sg_name}-${terraform.workspace}"
    }
)

}